# 🚀 Antigravity-Enhancer (反重力终极增强套件)

<p align="center">
  <b>让 Google Antigravity 拥有真正人性化的对话体验、永不失效的自愈汉化与多账号安全隔离。</b><br>
  <i>Smart Collapsible Bubbles, Self-Healing I18N Localization, and Safe Multi-Profile Switcher for Google Antigravity.</i>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Platform-Windows%20%7C%20macOS-blue?style=flat-square" alt="Platform">
  <img src="https://img.shields.io/badge/License-MIT-green?style=flat-square" alt="License">
  <img src="https://img.shields.io/badge/Antigravity-2.0%20Ready-orange?style=flat-square" alt="Antigravity">
  <img src="https://img.shields.io/badge/PRs-Welcome-brightgreen?style=flat-square" alt="PRs Welcome">
</p>

---

[English Documentation (README_EN.md)](README_EN.md) | **简体中文**

## 💡 为什么需要 Antigravity-Enhancer？

Google Antigravity 是一款强大的下一代 Agentic AI 桌面开发平台，但在日常重度使用中，社区开发者普遍面临三大痛点：

1. **🚫 吸顶遮挡严重**：官方底层强制对用户提问使用 `sticky top-0` 吸顶。当你输入稍长的提示词（分镜、Prompt、Excel 逻辑）时，长文本会死死钉在屏幕上半区，把 AI 回复的内容彻底挡住！
2. **💔 汉化升级就挂**：传统的修改 `app.asar` 汉化补丁，只要官方一自动更新就会被全面覆盖冲掉，每隔几天就得重新手动打补丁。
3. **⏳ 5小时限额卡脖子**：日常重度开发经常撞上配额上限，而频繁手动登出/登入切换账号不仅繁琐，还容易触发异常风控。

**Antigravity-Enhancer 为此而生，一站式完美解决上述所有痛点！**

---

## ✨ 核心特性

### 1. 🍊 智能折叠收纳气泡 (Smart Collapsible Bubble · 全网独家)
* **常态自动压缩**：无论你发了 5 行、20 行还是几十行的长指令，气泡在右上角**自动收纳为小胶囊尺寸**（最多显示约 2.5 行），视口保留 92% 以上的全景空间阅读 AI 回答，**彻底消灭视线遮挡**！
* **悬停丝滑展开**：鼠标移到气泡上，平滑动画展开展示全部文本并支持独立滚动；鼠标离开立即自动收拢。
* **左右严格分立**：用户在右侧（经典 Codex 蜜桃暖橙气泡 + 焦糖字），AI 在左侧，视觉左右两路清晰分明。

### 2. 🇨🇳 自愈式深度本地化汉化 (Self-Healing Zero-Dependency I18N)
* 覆盖菜单、系统设置、模型配置、Token 配额面板、MCP 面板等 360+ 核心交互词条。
* **软件升级永不失效**：基于 Chrome DevTools 协议（CDP）热注入 + Windows 自愈计划任务，即使官方夜间自动升级，后台守护秒级自动重新挂载，无需重新安装！

### 3. 👥 安全本地多账号分身 (Safe Multi-Profile Isolated Sandboxes)
* 基于 Chromium 原生 `--user-data-dir` 物理沙盒隔离。
* **0 反代、0 代理、零封号风险**：完全直连 Google 官方服务器，生成独立的桌面快捷方式（如“Antigravity 账号2”），多个账号永不掉线，双击秒开无缝接力。

### 4. 🎨 4K 极客图标库与文件夹定制
* 内置专为 Windows 高清缩放优化的 4K 多分辨率图标（`.ico`）：Google 官方彩虹波浪、Codex 3D 浮雕花、WorkBuddy 吉祥物等。

---

## 📦 目录结构

```text
antigravity-enhancer/
├── install.bat             # Windows 一键极速安装（推荐）
├── uninstall.bat           # 一键无痕还原
├── core/
│   ├── injector.mjs        # CDP 热注入引擎与常驻自愈服务
│   └── styles.css          # 核心样式：智能折叠气泡 + 左右分立排版
├── dicts/
│   ├── zh-CN.json          # 完整中文汉化词库（360+ 词条）
│   └── overrides.json      # 支持用户自定义词条扩充
├── modules/
│   └── multi-profile/      # 多账号分身创建工具 (create-profile.bat)
└── assets/
    └── icons/              # 4K 高清图标资产库
```

---

## 🚀 极速开始

### 环境要求
* Windows 10 / 11 或 macOS
* [Node.js](https://nodejs.org/) (v18 及以上)
* 已安装 [Google Antigravity](https://antigravity.google/) 客户端

### 一键安装 (Windows)
1. 下载并解压本项目；
2. 双击运行 **`install.bat`**；
3. 打开或刷新 Antigravity，所有增强特性即刻生效！

### 卸载恢复
* 双击运行 **`uninstall.bat`**，即可瞬间恢复 Antigravity 官方原生纯净状态。

---

## 🛠️ 创建多账号分身
进入 `modules/multi-profile/` 文件夹，双击运行 **`create-profile.bat`**，输入分身名称（例如 `Pro号`），桌面将自动生成该分身的专用快捷方式。在分身中登录另一个 Google 账号即可实现双号同时在线！

---

## 🤝 贡献与感谢
* 核心架构与设计：大春 (Dachun) & Antigravity Jarvis
* 欢迎提交 Issue 与 Pull Request 补充更多新版菜单词条与样式优化！

## 📄 开源许可
本项目遵循 [MIT License](LICENSE)。
