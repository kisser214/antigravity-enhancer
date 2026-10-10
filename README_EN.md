# 🚀 Antigravity-Enhancer

<p align="center">
  <b>Elevate your Google Antigravity desktop experience with Smart Collapsible Chat Bubbles, Strict Left-Right Layout, and Self-Healing I18N Localization.</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Version-v1.0.1-blue.svg?style=flat-square" alt="Version">
  <img src="https://img.shields.io/badge/Platform-Windows%20%7C%20macOS-blue?style=flat-square" alt="Platform">
  <img src="https://img.shields.io/badge/License-MIT-green?style=flat-square" alt="License">
  <img src="https://img.shields.io/badge/Antigravity-2.0%20Ready-orange?style=flat-square" alt="Antigravity">
</p>

---

[简体中文文档 (README.md)](README.md) | **English**

## 💡 Why Antigravity-Enhancer?

Google Antigravity is a groundbreaking agentic AI coding environment. However, power users frequently run into UX headaches:

1. **Sticky Header Overlap**: The native client pins user prompts with `sticky top-0`. When pasting long prompts (prompts, instructions, code snippets), the sticky container expands down the screen, blocking up to 60%-80% of the AI's response stream.
2. **Brittle ASAR Patches**: Modifying `app.asar` gets wiped out every time Antigravity automatically updates, requiring constant manual re-patching.

**Antigravity-Enhancer fixes all of these issues seamlessly.**

---

## ✨ Features

### 1. 🍊 Smart Collapsible Chat Bubbles (World-First)
* **Auto-Folding**: Long prompts collapse into a compact, elegant pill (~2.5 lines high, <8% screen height), leaving over 92% of the viewport open to read the AI's output.
* **Smooth Hover Expansion**: Hover your mouse over the bubble to smoothly expand the full text with a native scrollbar; move away and it instantly snaps back.
* **Strict Left-Right Alignment**: User messages on the right (warm Codex orange pastel `#FFEDD5` + deep caramel font `#7C2D12`), AI responses on the left.

### 2. 🇨🇳 Self-Healing Zero-Dependency I18N
* 360+ translated terms covering menus, advanced settings, token budgets, and custom skills.
* Injected via Chrome DevTools Protocol (CDP) and maintained by a background daemon. **Survives official auto-updates permanently without needing reinstallation.**

### 3. 🎨 4K Geek Icon Suite
* High-resolution multi-scale Windows `.ico` assets for custom folder and shortcut aesthetics.

---

## 💡 Best Practices: Multi-Account Management & Anti-Ban Tips

For power users who maintain multiple Google accounts to cycle through 5-hour model cooldowns and weekly quotas:

We recommend pairing with the standalone community utility **Antigravity Tools**:
* **Key Advantages**: Clean credential switcher with zero interference to your local workspace, paired with real-time visual tracking of 5-hour rolling limits and weekly caps.
* ⚠️ **Crucial Anti-Ban Notice**:
  * **DO NOT** enable the built-in "API Reverse Proxy" (API 反代) or "Relay Station" (中转站) features.
  * Use **Account Management (账号管理)** only to switch accounts for the official desktop app. This preserves authentic client headers and network safety. Running automated proxy relays or concurrent API scraping risks immediate account suspension by Google.

---

## 🚀 Quick Start (Windows)

1. Clone or download this repository.
2. Double-click **`install.bat`**.
3. Open or refresh Antigravity. Done!

To uninstall, simply run **`uninstall.bat`** to revert to the stock configuration.

---

## 📄 License
MIT License. Created with ❤️ by Dachun (kisser214) & Antigravity Jarvis.
