#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

shopt -s histappend
shopt -s checkwinsize


# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
HISTSIZE=5000
HISTFILESIZE=10000


PS1='${debian_chroot:+($debian_chroot)}\[\033[38;5;208m\]\u\[$(tput sgr0)\](๑˘ ₃˘๑) \[$(tput sgr0)\]\[\033[38;5;87m\]\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;216m\]\w\[$(tput sgr0)\]\$ '


# Export
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore-vcs -g "!{node_modules,.git,.idea,target,dist,out-tsc}"'
export VISUAL=nvim
export EDITOR='$VISUAL'
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


source ~/.env

# Tmux on startup
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi


# Aliases
alias proxy="proxychains"
