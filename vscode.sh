#!/bin/bash

# Setting Colors
GREEN='\033[1;32m'
RED='\033[1;31m'
PURPLE='\033[1;35m'
BLUE='\033[1;34m'
NO_COLOR='\033[0m'

# Clearing Terminal
clear
# Initial Message
printf "${BLUE}[Visual Studio Code Configuration]"

# Checking for Visual Studio Code Instance
if ! command -v code &>/dev/null; then
  printf "\n\n${RED}ERROR: code instance could not be found.${NO_COLOR} "
  read -r -p "Install? [y/N] " 
  case "$REPLY" in
      [yY][eE][sS]|[yY]) 
          brew install --cask visual-studio-code
          ;;  
      *)
          printf "\n${RED}[Visual Studio Code Configuration Finished Unsuccessfully]\n"
          exit 1;
          ;;
  esac
fi

# Installing Extensions
printf "\n\n${PURPLE}[EXTENSIONS]${NO_COLOR}\n"

code --install-extension esbenp.prettier-vscode --force # Prettier
code --install-extension formulahendry.auto-rename-tag --force # Auto Rename Tag
code --install-extension naumovs.color-highlight --force # Color Highlight
code --install-extension PKief.material-icon-theme --force # Material Icon Theme
code --install-extension ritwickdey.LiveServer --force # Live Server
code --install-extension TabNine.tabnine-vscode --force # Tabnine
code --install-extension zhuangtongfa.Material-theme --force # One Dark Pro 
code --install-extension kisstkondoros.vscode-gutter-preview --force # Picture Preview

printf "\n${PURPLE}[APPLYING JSON CONFIGURATIONS]${NO_COLOR}\n"
SETTINGS='
{
  "workbench.iconTheme": "material-icon-theme",
  "workbench.startupEditor": "none",
  "editor.tabSize": 2,
  "editor.minimap.enabled": false,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.formatOnSave": true,
  "files.autoSave": "onFocusChange",
  "explorer.confirmDelete": false,
  "workbench.colorTheme": "One Dark Pro Darker",
  "tabnine.experimentalAutoImports": true,
}
'
echo $SETTINGS > "$HOME/Library/Application Support/Code/User/settings.json"

printf "\n${GREEN}[Visual Studio Code Configuration Finished Successfully]\n"
exit 0;