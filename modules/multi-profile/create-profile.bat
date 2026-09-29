@echo off
chcp 65001 >nul
title Antigravity 多账号安全分身创建工具

echo ========================================================
echo   Antigravity 安全本地多账号分身创建器
echo   原理：基于原生 Chromium --user-data-dir 物理沙盒隔离
echo   优势：100%% 官方原生直连、0 反代、0 代理、零封号风险
echo ========================================================
echo.

set /p PROFILE_NAME="请输入新分身名称（例如：账号2、Pro号、小号）: "
if "%PROFILE_NAME%"=="" (
    echo [错误] 名称不能为空！
    pause
    exit /b 1
)

set "PROFILE_DIR=%APPDATA%\Antigravity-Profiles\%PROFILE_NAME%"
if not exist "%PROFILE_DIR%" mkdir "%PROFILE_DIR%"

set "APP_EXE=%LOCALAPPDATA%\Programs\antigravity\Antigravity.exe"
if not exist "%APP_EXE%" (
    set "APP_EXE=%PROGRAMFILES%\Antigravity\Antigravity.exe"
)

if not exist "%APP_EXE%" (
    echo [错误] 未找到 Antigravity.exe 安装路径，请确认是否已安装。
    pause
    exit /b 1
)

echo.
echo [1/2] 正在创建分身独立数据目录: %PROFILE_DIR% ...
echo [2/2] 正在桌面生成分身专属快捷方式: "Antigravity (%PROFILE_NAME%)" ...

powershell -NoProfile -Command ^
  "$ws = New-Object -ComObject WScript.Shell; " ^
  "$s = $ws.CreateShortcut([System.IO.Path]::Combine([Environment]::GetFolderPath('Desktop'), 'Antigravity (%PROFILE_NAME%).lnk')); " ^
  "$s.TargetPath = '%APP_EXE%'; " ^
  "$s.Arguments = '--user-data-dir=`\"%PROFILE_DIR%`\"'; " ^
  "$s.WorkingDirectory = [System.IO.Path]::GetDirectoryName('%APP_EXE%'); " ^
  "$s.IconLocation = '%APP_EXE%,0'; " ^
  "$s.Save()"

echo.
echo ========================================================
echo   ✅ 分身创建成功！
echo   请直接在桌面双击启动：Antigravity (%PROFILE_NAME%)
echo   在分身中登录您的第 2/3 个 Google 账号即可永久保持登录！
echo ========================================================
echo.
pause
