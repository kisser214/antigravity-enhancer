import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const ROOT_DIR = path.resolve(__dirname, '..');

const PORT_FILE = path.join(process.env.APPDATA || '', 'Antigravity', 'DevToolsActivePort');
const PID_FILE = path.join(ROOT_DIR, 'daemon.pid');

try {
  fs.writeFileSync(PID_FILE, process.pid.toString(), 'utf8');
} catch (err) {}

process.on('exit', () => {
  try {
    if (fs.existsSync(PID_FILE)) fs.unlinkSync(PID_FILE);
  } catch (err) {}
});

function loadStyles() {
  const stylePath = path.join(__dirname, 'styles.css');
  return fs.existsSync(stylePath) ? fs.readFileSync(stylePath, 'utf8') : '';
}

function loadDict() {
  let dict = {};
  const baseDictPath = path.join(ROOT_DIR, 'dicts', 'zh-CN.json');
  const overrideDictPath = path.join(ROOT_DIR, 'dicts', 'overrides.json');
  if (fs.existsSync(baseDictPath)) {
    try {
      dict = JSON.parse(fs.readFileSync(baseDictPath, 'utf8'));
    } catch (e) {}
  }
  if (fs.existsSync(overrideDictPath)) {
    try {
      const overrides = JSON.parse(fs.readFileSync(overrideDictPath, 'utf8'));
      Object.assign(dict, overrides);
    } catch (e) {}
  }
  return dict;
}

const CSS = loadStyles();
const DICT = loadDict();

const INJECT_EXPR = `
  (function() {
    // 1. 注入智能折叠气泡样式
    let style = document.getElementById('antigravity-enhancer-styles');
    if (!style) {
      style = document.createElement('style');
      style.id = 'antigravity-enhancer-styles';
      document.head.appendChild(style);
    }
    const targetCSS = ${JSON.stringify(CSS)};
    if (style.innerHTML !== targetCSS) {
      style.innerHTML = targetCSS;
    }

    // 2. 注入全局汉化与实时观察
    const dict = ${JSON.stringify(DICT)};
    const targetValues = new Set(Object.values(dict));

    function translateNode(root) {
      if (!root) return;
      const walker = document.createTreeWalker(root, NodeFilter.SHOW_TEXT);
      let node;
      while ((node = walker.nextNode())) {
        if (node.parentElement && ['CODE', 'PRE', 'TEXTAREA', 'SCRIPT', 'STYLE'].includes(node.parentElement.tagName)) {
          continue;
        }
        const text = node.textContent.trim();
        if (dict[text] && !targetValues.has(text)) {
          node.textContent = node.textContent.replace(text, dict[text]);
        }
      }
      const inputs = (root.querySelectorAll ? root.querySelectorAll('textarea, input') : []);
      inputs.forEach(el => {
        if (el.placeholder && el.placeholder.includes('Ask anything')) {
          el.placeholder = '输入消息，@ 提及员工/文件 / 斜杠指令...';
        }
      });
    }

    translateNode(document.body);

    if (!window.__antigravity_enhancer_active) {
      window.__antigravity_enhancer_active = true;

      const observer = new MutationObserver((mutations) => {
        for (const m of mutations) {
          if (m.type === 'childList') {
            m.addedNodes.forEach(n => {
              if (n.nodeType === Node.ELEMENT_NODE || n.nodeType === Node.TEXT_NODE) {
                translateNode(n);
              }
            });
          } else if (m.type === 'characterData') {
            const text = m.target.textContent.trim();
            if (dict[text] && !targetValues.has(text)) {
              m.target.textContent = m.target.textContent.replace(text, dict[text]);
            }
          }
        }
      });

      observer.observe(document.body, { childList: true, subtree: true, characterData: true });
    }
    return 'ENHANCED';
  })()
`;

async function checkAndInject() {
  if (!fs.existsSync(PORT_FILE)) return;

  let port = '';
  try {
    const lines = fs.readFileSync(PORT_FILE, 'utf8').trim().split('\n');
    port = lines[0].trim();
    if (!port) return;
  } catch (e) {
    return;
  }

  try {
    const targetsRes = await fetch(`http://127.0.0.1:${port}/json`);
    const targets = await targetsRes.json();
    const pages = targets.filter(t => t.type === 'page' && t.webSocketDebuggerUrl);

    for (const page of pages) {
      try {
        const ws = new WebSocket(page.webSocketDebuggerUrl);
        ws.onopen = () => {
          ws.send(JSON.stringify({
            id: 1,
            method: 'Runtime.evaluate',
            params: { expression: INJECT_EXPR }
          }));
          setTimeout(() => {
            try { ws.close(); } catch (err) {}
          }, 300);
        };
        ws.onerror = () => {};
      } catch (e) {}
    }
  } catch (e) {}
}

// 守护自愈轮询：开机或软件重启均自愈保活
setInterval(checkAndInject, 3000);
checkAndInject();
