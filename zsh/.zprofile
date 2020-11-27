#!/usr/bin/zsh
# zsh profile file. Runs on login. Environmental variables are set here.
setxkbmap -layout us,de -option grp:win_space_toggle,ctrl:nocaps;

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export TERMINAL='alacritty'
export READER='zathura'
export BROWSER='firefox'
export SUDO_ASKPASS=/usr/lib/ssh/x11-ssh-askpass
export GIT_ASKPASS=/usr/lib/ssh/x11-ssh-askpass
export SSH_ASKPASS=/usr/lib/ssh/x11-ssh-askpass

export XDG_SESSION_TYPE="wayland dbus-run-session gnome-session"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export MOZ_USE_XINPUT2="1"		# Mozilla smooth scrolling/touchpads.
export _JAVA_AWT_WM_NONREPARENTING=1	# Fix for Java applications in dwm

# Use ripgrep for fuzzy finder
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

# Language
if [[ -z "$LANG" ]]; then
	export LANG='en_US.UTF-8'
fi

# Paths
export PATH=$HOME/.scripts/:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/flutter/bin:$PATH
export PATH=$HOME/.local/share/go/bin:$PATH
export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
	/usr/local/{bin,sbin}
	$path
)

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
	export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep dwm || startx
fi
