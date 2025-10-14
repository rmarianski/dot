# Essential zsh options
setopt AUTO_CD HIST_VERIFY SHARE_HISTORY
setopt EXTENDED_HISTORY HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS HIST_IGNORE_SPACE HIST_SAVE_NO_DUPS
setopt EXTENDED_GLOB

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Essential PATH setup
export ORIG_PATH=$PATH
export PATH=$HOME/bin:$PATH

# Essential environment variables
# GPG_TTY - only set when needed to avoid tty command on every startup
[[ -n "$SSH_CONNECTION" ]] && export GPG_TTY=$(tty)
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

# Load aliases and functions
source ~/.zsh_aliases_kubernetes
source ~/.zsh_aliases_git
source ~/.zsh_aliases_misc

# Load abbreviation system
source ~/.zsh_abk

# Fast completion system - skip security checks for speed
autoload -Uz compinit && compinit -C

# Case-insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Vi keybindings for menu completion navigation
zmodload zsh/complist 2>/dev/null
bindkey -M menuselect 'h' vi-backward-char        # left
bindkey -M menuselect 'k' vi-up-line-or-history   # up
bindkey -M menuselect 'l' vi-forward-char         # right
bindkey -M menuselect 'j' vi-down-line-or-history # bottom

# Edit command line keybindings
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# System specific configuration
if [ -r $HOME/.zsh_local ]; then
  source $HOME/.zsh_local
fi

# Initialize Starship prompt (must be last)
eval "$(starship init zsh)"
