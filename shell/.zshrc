# Load completion system
autoload -Uz compinit && compinit

# Initializations
source $HOME/.antidote/antidote.zsh
antidote load

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

eval "$(~/.local/bin/mise activate zsh)"

eval "$(zoxide init --cmd cd zsh)"

eval "$(fzf --zsh)"

eval "$(direnv hook zsh)"

eval "$(atuin init zsh)"

eval "$(procs --gen-completion-out zsh)"

# History and search options
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE=$HOME/.zsh_history
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Styling and intializing completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --almost-all --group-directories-first --color=auto --icons=auto --long --git --bytes $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --almost-all --group-directories-first --color=auto --icons=auto --long --git --bytes $realpath'

# Set key bindings
bindkey -e
bindkey '^y' autosuggest-accept
bindkey "^[[3~" delete-char

# Set aliases
alias vi="nvim"
alias vim="nvim"

alias cat="bat -pp"
alias cet="bat"

alias l="eza --almost-all --group-directories-first --color=auto --icons=auto --long --git --bytes"
alias ls="eza --group-directories-first --color=auto --icons=auto"
alias ll="eza --group-directories-first --color=auto --icons=auto --long --git --bytes"
alias lt="eza --tree --level=2 --group-directories-first --color=auto --icons=auto"
alias la="eza --tree --level=2 --almost-all --group-directories-first --color=auto --icons=auto"

alias sed="sd"

alias find="fd"

alias grep="rg"

alias top="btm"

alias hexdump="hexyl"

alias du="dust"

alias men="tldr"

# Initialize Zellij
SESSION_NAME="felix"
SESSION_FOUND=$(zellij list-sessions | /usr/bin/grep "$SESSION_NAME" | wc -l)

if [[ -z "$ZELLIJ" ]]; then
  if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
    zellij attach -c
  else
    zellij da -y
    zellij attach -c "$SESSION_NAME"
  fi

  if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
    exit
  fi
fi

# Initialize Starship
eval "$(starship init zsh)"
