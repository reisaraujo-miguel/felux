#!/usr/bin/env zsh

# enable kitty shell integration even if inside toolbox/distrobox
if [ -d "/usr/lib64/kitty/shell-integration/zsh" ] && [[ "$TERM" == "xterm-kitty" ]]; then
  export KITTY_SHELL_INTEGRATION="enabled"
  autoload -Uz /usr/lib64/kitty/shell-integration/zsh/kitty-integration
  kitty-integration
  unfunction kitty-integration
fi

export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"} && mkdir -p "$XDG_DATA_HOME"
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"} && mkdir -p "$XDG_CACHE_HOME"
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"} && mkdir -p "$XDG_CONFIG_HOME"
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"} && mkdir -p "$XDG_STATE_HOME"

export LESSHISTFILE=-

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export ZDOTDIR="$HOME/.config/zsh"
export HISTFILE="$XDG_DATA_HOME/zsh-history"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export LEIN_HOME="$XDG_DATA_HOME/lein"

# https://blog.patshead.com/2011/04/improve-your-oh-my-zsh-startup-time-maybe.html
skip_global_compinit=1

export SYSTEM=$(uname -s)
export SHELL=/bin/zsh

if [[ ("$SHLVL" -eq 1 && ! -o LOGIN) && -s "${ZDOTDIR:-$HOME/.config/zsh}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME/.config/zsh}/.zprofile"
fi

