# melops dotfiles

Clone the Repo
```sh
git clone https://github.com/melops-hh/dotfiles.git $HOME/.config
```
Or if you have set the ssh config already
```sh
git clone git@melops-github:melops-hh/dotfiles.git
```

## Theme
Install Theme
```sh
yay -S nordic-theme-git
```
Create Symlink
```sh
ln -s ~/.config/.gtkrc-2.0 ~/.gtkrc-2.0
```

## Link config files
Create symlinks
```sh
ln -s ~/.config/xinitrc ~/.xinitrc
ln -s ~/.config/zsh/.zshenv ~/.zshenv
```
