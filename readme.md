# Neovim Config

## Prerequisites 
```sh
# Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Brew things
brew install ripgrep
brew install fd
brew install shellcheck
brew install vale

# NPM things
brew install npm
npm install -g bash-language-server
npm install -g pyright
npm install -g vscode-langservers-extracted
npm install -g eslint
npm install -g sql-language-server
npm install -g typescript-language-server typescript

# Golang things
go install golang.org/x/tools/gopls@latest

# Patched font for terminal
# https://www.nerdfonts.com
```
