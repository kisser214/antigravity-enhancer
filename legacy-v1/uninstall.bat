@echo off
chcp 65001 >nul
title Antigravity-Enhancer 一键无痕卸载

echo ========================================================
echo       🧹 Antigravity-Enhancer 一键无痕还原
echo ========================================================
echo.

echo 正在停止并删除守护任务...
schtasks /End /TN "Antigravity_Enhancer_Daemon" >nul 2>nul
schtasks /Delete /TN "Antigravity_Enhancer_Daemon" /F >nul 2>nul
schtasks /End /TN "Antigravity_CodexBubble" >nul 2>nul
schtasks /Delete /TN "Antigravity_CodexBubble" /F >nul 2>nul

set "PID_FILE=%~dp0daemon.pid"
if exist "%PID_FILE%" (
    set /p OLD_PID=<"%PID_FILE%"
    taskkill /PID %OLD_PID% /F >nul 2>nul
    del "%PID_FILE%" >nul 2>nul
)

echo.
echo ========================================================
echo   ✅ 卸载完成！
echo   已停止所有增强注入，Antigravity 已恢复官方原生状态。
echo   (刷新或重启 Antigravity 即可看到原始状态)
echo ========================================================
echo.
pause
