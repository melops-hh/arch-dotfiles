# NeoVim

Install neovim 
```sh
sudo pacman -S neovim
```

Install a plugin manager - vim-plug
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Install plugins
```sh
nvim ~/.config/nvim/init.vim +PlugInstall
```

Add an alias to your .bashrc or .zshrc
```
alias vim="nvim"
```
