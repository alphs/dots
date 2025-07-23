
fpath+=("$CONFIG_DOTS/zsh/completion")

zstyle ':completion:*:*:git:*' script "$HOME/.nix-profile/share/git/contrib/completion/git-completion.bash"

ZSH_COMPDUMP="${ZDOTDIR:-$HOME}/.zcompdump"

autoload -U compinit

# this should be last

# count the number of files starting with "_" in fpath (completion files)
local -a completion_files=($fpath/_*(N))

if [[ ! -s "${ZSH_COMPDUMP}.zwc" || ${#completion_files} -ne $(cat "${ZSH_COMPDUMP}.count" 2>/dev/null) ]]; then
  # regenerate
  compinit -i
  echo ${#completion_files} >! "${ZSH_COMPDUMP}.count"
else
  # load cache
  compinit -C
fi
unset completion_files

if command mkdir "${ZSH_COMPDUMP}.lock" 2>/dev/null; then
  trap 'command rm -rf "${ZSH_COMPDUMP}.lock"' EXIT
  autoload -U zrecompile && zrecompile -q -p "$ZSH_COMPDUMP"
  # If zrecompile was successful, we can also clean up the old file.
  command rm -f "$ZSH_COMPDUMP.zwc.old"
  command rm -rf "${ZSH_COMPDUMP}.lock"
  trap - EXIT
fi

