# ⚡️.dotfiles | batteries included dotfile configurations

## sublime text 3 setup
This directory contains the information required to get your sublime text 3 setup for the config file in this folder.

## install (macOS)
Installing should be like 3 steps:

- Download & install [Sublime Text 3](https://www.sublimetext.com/3) and make sure it runs.
- Close Sublime Text 3
- Run the script `./install-step1` to configure Package Control and the desired packages. Once you launch sublime to continue the package installation, you can press ctrl + \` to see package installation progress. You may need to restart Sublime once as there could be dependencies that require a hard reboot of the app :|  
- Once the console output shows something like `ignored packages updated to: ["Vintage"]`, the package installation is done and you can continue to run step2.
- Close Sublime Text 3
- Run the script `./install-step2` to configure user settings.

Done!
