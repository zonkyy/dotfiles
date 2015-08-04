# ペインが 1 つならペイン分割
# ペインが 2 つならペイン移動
function tmuxpane_select_or_create_pane() {
    local num_of_pane=$(tmux list-pane | wc -l)
    if [[ $num_of_pane > 1 ]]; then
        tmux select-pane -t :.+
    else
        tmux split-window -h
    fi
    zle reset-prompt
}
zle -N tmuxpane_select_or_create_pane
