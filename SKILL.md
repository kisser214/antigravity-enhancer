---
name: antigravity-enhancer
description: Ultimate enhancement toolkit for Google Antigravity. Provides smart collapsible chat bubbles (preventing long-prompt sticky overlap), self-healing zero-dependency Chinese i18n localization, and 4K icons.
---

# Antigravity-Enhancer Skill

This skill equips Antigravity agents and users with tools to enhance the Antigravity desktop IDE environment:

## Capabilities
1. **Smart Collapsible Chat Bubbles**: Solves the official `sticky top-0` bug where long user prompts block AI generation streaming. Automatically collapses long prompts to a compact 2-line pill, expanding smoothly on mouse hover.
2. **Self-Healing I18N Localization**: 360+ Chinese translation strings injected via Chrome DevTools Protocol (CDP), maintained by a background daemon that automatically recovers even after official client updates.
3. **4K Geek Icon Suite**: Provides high-resolution icons and shortcuts.

## Usage
- Run `install.bat` on Windows to install and activate background daemon.
- Run `uninstall.bat` to revert to stock Antigravity.
