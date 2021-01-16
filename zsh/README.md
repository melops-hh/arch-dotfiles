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

if you just want to use zsh not all other dotfiles:
```sh
wget -o ${ZDOTDIR}/.p10k.zsh https://raw.githubusercontent.com/melops-hh/dotfiles/master/zsh/.p10k.zsh && \
wget -o ${ZDOTDIR}/.zpreztorc https://raw.githubusercontent.com/melops-hh/dotfiles/master/zsh/.zpreztorc && \
wget -o ${ZDOTDIR}/.zprofile https://raw.githubusercontent.com/melops-hh/dotfiles/master/zsh/.zprofile && \
wget -o ${ZDOTDIR}/.zshenv https://raw.githubusercontent.com/melops-hh/dotfiles/master/zsh/.zshenv && \
wget -o ${ZDOTDIR}/.zshrc https://raw.githubusercontent.com/melops-hh/dotfiles/master/zsh/
.zshrc 
```

Clone the Prezto Repo
```sh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```

Create symlinks
```sh
ln -s $ZDOTDIR/.zprezto/runcoms/zlogin $ZDOTDIR/.zlogin
ln -s $ZDOTDIR/.zprezto/runcoms/zlogout $ZDOTDIR/.zlogout
ln -s $ZDOTDIR/.zshenv $HOME/.zshenv
```

Set Zsh as default
```sh
chsh -s /bin/zsh
```
