#zmodload zsh/zprof

local zap_path="${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
[ -f "$zap_path" ] && source "$zap_path"

# --- default
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
# --- 
# --- plugs
plug "zsh-users/zsh-history-substring-search"
# ---
# --- local
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"
plug "$HOME/.config/zsh/zsh-lsd.zsh"
# ---

HISTFILE="$HOME/.zsh_history"

##zstyle ':completion:*:*:git:*' script $HOME/.config/dots/installs/from_source/git-source/contrib/completion/git-completion.bash

# Load and initialise completion system
autoload -Uz compinit
compinit

eval "$(zoxide init zsh --cmd cd)"


. "$HOME/.cargo/env"

# Should be at the end
eval "$(starship init zsh)"
#zprof
