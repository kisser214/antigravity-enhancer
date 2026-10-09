@echo off
chcp 65001 >nul
title Antigravity-Enhancer 增强套件一键安装器

echo ========================================================
echo       🚀 Antigravity-Enhancer 增强套件一键安装
echo   (智能防遮挡折叠气泡 + 自愈汉化 + 左右分立排版)
echo ========================================================
echo.

:: 1. 检查 Node.js 环境
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [错误] 未检测到 Node.js 环境！
    echo 请先安装 Node.js (https://nodejs.org/) 后再运行本安装器。
    echo.
    pause
    exit /b 1
)

set "SCRIPT_DIR=%~dp0"
set "INJECTOR_PATH=%SCRIPT_DIR%core\injector.mjs"

echo [1/3] 正在检测 Antigravity 安装环境...
echo [2/3] 正在注册 Windows 自愈守护计划任务...

:: 停用旧版并创建新版任务
schtasks /End /TN "Antigravity_Enhancer_Daemon" >nul 2>nul
schtasks /Delete /TN "Antigravity_Enhancer_Daemon" /F >nul 2>nul
schtasks /End /TN "Antigravity_CodexBubble" >nul 2>nul
schtasks /Delete /TN "Antigravity_CodexBubble" /F >nul 2>nul

schtasks /Create /TN "Antigravity_Enhancer_Daemon" /TR "node \"%INJECTOR_PATH%\"" /SC ONLOGON /RL HIGHEST /F >nul

echo [3/3] 正在启动实时注入与自愈守护引擎...
schtasks /Run /TN "Antigravity_Enhancer_Daemon" >nul

echo.
echo ========================================================
echo   🎉 安装成功！增强特性已实时热生效！
echo.
echo   ✨ 核心特性一览：
echo     1. 🍊 智能折叠气泡：长文本自动收起，悬停丝滑展开
echo     2. 🇨🇳 自愈式深度汉化：软件自动更新后仍永不失效
echo     3. 🎨 4K极客图标包：位于 assets\icons 目录
echo ========================================================
echo.
pause
