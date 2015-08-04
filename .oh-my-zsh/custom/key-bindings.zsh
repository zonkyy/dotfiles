# 履歴検索: C-p,n で検索・補完
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# history incremental search
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

# plugin
bindkey "^[+" anyframe-widget-cdr
bindkey "^[*" anyframe-widget-execute-history
bindkey "^[x" anyframe-widget-select-widget
