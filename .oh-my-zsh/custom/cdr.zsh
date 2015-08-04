autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

zstyle ':completion:*:*:cdr:*:*' menu selection
zstyle ":completion:*" recent-dirs-insert always

zstyle ":chpwd:*" recent-dirs-default true
zstyle ":chpwd:*" recent-dirs-max 5000
