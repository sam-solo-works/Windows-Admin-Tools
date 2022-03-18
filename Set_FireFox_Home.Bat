cd /D "%APPDATA%\Mozilla\Firefox\Profiles"
cd *.default
set ffile=%cd%
echo user_pref("browser.startup.homepage", "https://napaanesthesia.sharepoint.com/sites/MyNAPA");>>"%ffile%\prefs.js"
set ffile=
cd %windir%