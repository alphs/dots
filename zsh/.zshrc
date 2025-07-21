#zmodload zsh/zpro

local zap_path="${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
[ -f "$zap_path" ] && source "$zap_path" || echo "Zap not installed, mby run '$CONFIG_DOTS/scripts/zap_install.sh -k'"


## Plugins
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
#plug "zdharma-continuum/fast-syntax-highlighting"
#
## Local
plug "$CONFIG_DOTS/zsh/aliases.zsh"
plug "$CONFIG_DOTS/zsh/exports.zsh"
plug "$CONFIG_DOTS/zsh/binds.zsh"
plug "$CONFIG_DOTS/zsh/zsh-lsd.zsh"

plug "$CONFIG_DOTS/zsh/nix-stuff.zsh"
fpath+=("$CONFIG_DOTS/zsh/completion")

HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
HISTSIZE=5000000
SAVEHIST=5000000

setopt APPEND_HISTORY            # Append to history file instead of overwriting.
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

setopt NO_AUTO_CD

zstyle ':completion:*:*:git:*' script "$HOME/.nix-profile/share/git/contrib/completion/git-completion.bash"

eval "$(fzf --zsh)"
bindkey -M vicmd '^R' redo # fzf overrides all modes

# Load and initialise completion system
autoload -Uz compinit
compinit

eval "$(zoxide init zsh --cmd cd)"

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Should be at the end
eval "$(starship init zsh)"
#zprof
