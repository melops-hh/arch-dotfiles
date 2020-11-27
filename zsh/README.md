# Install Zsh and Prezto

Install Zsh
```sh
yay zsh
# or
sudo pacman -S zsh
```

Launch Zsh
```sh
zsh
```

Create zsh directory
```sh
mkdir -pv .config/zsh
```

Set ZDOTDIR
```
export ZDOTDIR="${HOME}/.config/zsh"
```

Clone the Prezto Repo
```sh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```

Set zlogin and zlogout links
```sh
ln -s $ZDOTDIR/.zprezto/runcoms/zlogin $ZDOTDIR/.zlogin
ln -s $ZDOTDIR/.zprezto/runcoms/zlogout $ZDOTDIR/.zlogout
```

Set Zsh as default
```sh
chsh -s /bin/zsh
```
