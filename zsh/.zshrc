export PATH=$HOME/.local/bin:$PATH

export XDG_CONFIG_HOME=$HOME/.config

# Zimfw

ZIM_HOME=~/.zim

# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

# Some plugin customization
zvm_after_init_commands+=('bindkey -M viins "^N" history-beginning-search-forward; bindkey -M viins "^P" history-beginning-search-backward')

# Initialize modules.
source ${ZIM_HOME}/init.zsh

export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# bun completions
[ -s "/Users/joanbellavista/.bun/_bun" ] && source "/Users/joanbellavista/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# sst
export PATH=/home/joanbellavista/.sst/bin:$PATH

alias v=nvim
alias ta='tmux attach'

if [[ -f "$HOME/.cargo/env" ]]; then
  source "$HOME/.cargo/env";
fi

eval "$(~/.local/bin/mise activate zsh)" 
