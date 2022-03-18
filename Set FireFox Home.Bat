cd /D "%APPDATA%\Mozilla\Firefox\Profiles"
cd *.default
set ffile=%cd%
echo user_pref("browser.startup.homepage", "https://test.sharepoint.com/");>>"%ffile%\prefs.js"
set ffile=
cd %windir%
