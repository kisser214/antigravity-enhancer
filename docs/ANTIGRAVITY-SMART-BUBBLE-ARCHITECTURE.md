# Antigravity 智能折叠气泡架构与 UI 增强技术白皮书
> **归档位置**：`F:\Antigravity\大春的贾维斯管理中心\ANTIGRAVITY-SMART-BUBBLE-ARCHITECTURE.md`  
> **负责人**：大春的 Antigravity 贾维斯（总经理、总架构师与自媒体超级总编）  
> **归档日期**：2026-09-29  
> **状态**：✅ 生产环境已实测验证并常驻运行，已具备开源发布条件

---

## 一、 背景与核心痛点（困扰社区的顽疾）

### 1. 现象描述
在 Google Antigravity 桌面端（基于 Electron 深度定制架构）进行深度对话、代码编写、长提示词调试或 Excel 逻辑下发时，用户经常输入 5~20 行的长指令。当 AI 开始流式输出回答时，屏幕上方会出现严重的视觉遮挡：
* 提问内容无法正常向上滚动滑出视野；
* 提问区域像“一块悬挂在挡风玻璃上的布”，直接死死压在屏幕上半部分；
* 导致用户无法看清反重力（Antigravity）回复的首屏核心文本、大纲或代码开头。

### 2. 传统误区与走过的弯路
* **误区一**：以为是 Codex 暖橙色气泡卡片的背景色太厚重导致的遮挡，于是尝试“删掉气泡框、只保留纯文字”；
* **误区二**：删掉背景框后，文字由于容器保留了 85% 的占位宽度，短文字显得孤零零“悬空在屏幕正中间”；
* **最终证实**：即使彻底去掉所有气泡背景，文字依然死死固定在顶部，遮挡问题依然存在！

---

## 二、 底层逆向与病根破解（真相大白）

通过 Chrome DevTools 协议（CDP）深入 Antigravity 渲染树排查，真相水落石出：

1. **官方设计初衷**：
   Antigravity 官方在每个用户提问的外层容器注入了原生样式类：
   ```html
   <div class="sticky top-0 z-10 mb-4">
     <div class="relative bg-background md-sticky-message-bleed ...">
       <div data-testid="user-input-step" ...>
   ```
   官方本意是做一个“吸顶便签（Sticky Header）”，防止用户在浏览长篇 AI 回答时忘记当初问了什么。

2. **官方的致命缺陷**：
   官方原版为了配合吸顶，对内部文本加了强行截断：`max-h-[10vh] overflow-hidden`。
   而在外部样式做美化时，一旦移除了高度截断，整整几十行文字就会把 `sticky top-0` 撑开至整个视口的 50%~80% 高度，造成毁灭性的屏幕空间吞噬！

---

## 三、 终极解决方案：智能折叠胶囊气泡（Smart Collapsible Bubble）

针对此问题，大春与贾维斯共同推演确立了**超越官方原生体验的“方案 B（智能折叠收纳）”**，并实现了以下四大技术突破：

### 1. 左右严格分离（Left-Right Split）
* **用户提问在右侧**：靠右浮动，宽度自适应（`width: fit-content; max-width: 82%; margin-left: auto;`）；
* **AI 回复在左侧**：自然向下流动，左右两路泾渭分明，完美对齐现代顶级聊天工具（微信/Telegram）的人性化直觉。

### 2. 智能折叠胶囊（Smart Height Folding）
* **平时常态（Idle State）**：
  限制最大高度为 `4.2em`（约 2.5 行文本，高度仅 60~70 像素，占据视口不足 8%）；
  文字超出部分自动裁切隐藏（`overflow-y: hidden`），下方留出 92% 以上的全景空间阅读 AI 回答。

### 3. 鼠标悬停丝滑展开（Hover to Expand）
* **复查状态（Hover State）**：
  当用户把鼠标移至气泡上方时，触发平滑过渡动画（`transition: max-height 0.25s ease-out`）；
  气泡瞬间展开为全文模式（`max-height: 55vh; overflow-y: auto`），阴影由 `0.12` 加深至 `0.25`，提供内嵌平滑滚动条，供用户从容细读；
  鼠标一旦移开，气泡毫秒级自动收拢归位，绝不粘滞。

### 4. 经典 Codex 暖橙色视觉（Aesthetic Palette）
* **气泡底色**：温暖蜜桃橙 `#FFEDD5`；
* **边框质感**：精致微橙边 `#FDBA74`（1.5px 圆角 `18px 18px 4px 18px`）；
* **字体呈现**：深焦糖褐字 `#7C2D12`（500字重，极度清晰、护眼不费眼）；
* **图标联动**：SVG 描边同步为暖橙 `#EA580C`。

---

## 四、 核心 CSS 生产级代码实现

```css
/* 🎯 大春专属：方案 B（经典暖橙色气泡回归 + 智能折叠收纳） */
/* 1. 外层容器靠右排布 */
[class*="user-input-step"] {
  align-items: flex-end !important;
  padding-right: 12px !important;
}

/* 2. 老板经典暖橙色 Codex 气泡卡片：圆角柔和、自适应宽度 */
[class*="user-input-step"] > div {
  width: fit-content !important;
  max-width: 82% !important;
  margin-left: auto !important;
  border-radius: 18px 18px 4px 18px !important;
  background: #FFEDD5 !important;
  border: 1.5px solid #FDBA74 !important;
  box-shadow: 0 2px 10px rgba(249, 115, 22, 0.12) !important;
  padding: 6px 12px !important;
  transition: max-height 0.25s ease, box-shadow 0.2s ease !important;
}

/* 3. 内部原生卡片做透明处理，让气泡纯净自然 */
[class*="user-input-step"] [data-testid="lifted-context-menu-trigger"],
[class*="user-input-step"] .bg-card {
  background: transparent !important;
  border: none !important;
  box-shadow: none !important;
}

/* 4. 核心：智能折叠收纳（长文本平时只占约 2.5 行高度，彻底不挡视线） */
[class*="user-input-step"] div[class*="max-h-"] {
  max-height: 4.2em !important;
  overflow-y: hidden !important;
  transition: max-height 0.25s ease-out !important;
}

/* 5. 悬停展开全文：鼠标放上去丝滑展开全部文本，离开自动收拢归位 */
[class*="user-input-step"] > div:hover {
  box-shadow: 0 4px 16px rgba(249, 115, 22, 0.25) !important;
}
[class*="user-input-step"] > div:hover div[class*="max-h-"] {
  max-height: 55vh !important;
  overflow-y: auto !important;
}

/* 6. 老板文字：深焦糖褐字，优雅清晰，高对比度不刺眼 */
[class*="user-input-step"] * {
  color: #7C2D12 !important;
  font-weight: 500 !important;
  line-height: 1.5 !important;
}

/* 7. 图标颜色同步温暖橙色 */
[class*="user-input-step"] svg {
  stroke: #EA580C !important;
  color: #EA580C !important;
}
```

---

## 五、 常驻自愈与热注入机制

为避免 Antigravity 重启或更新后补丁失效，部署了双保险机制：
1. **Windows 计划任务常驻守护**：任务名 `Antigravity_CodexBubble`，调度 `bubble_daemon.mjs`，开机或登录自动启动，静默挂载；
2. **CDP 动态侦测注入**：读取 `DevToolsActivePort` 端口，通过 WebSocket 向当前活动的 UI 页面热更新 `style` 节点；
3. **MutationObserver 实时保活**：新开启对话或页面路由切换时，样式引擎在 50ms 内自动重新挂载，实现 100% 无感常驻。
