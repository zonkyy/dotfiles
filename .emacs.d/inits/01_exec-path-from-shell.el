;;;; シェルの環境変数を Emacs で使用する

(use-package exec-path-from-shell
  :ensure exec-path-from-shell)

;;; oh-my-zsh で ZSH_TMUX_AUTOSTART = true のとき
;;; 環境変数を取得できない問題への対策
(setenv "ZSH_TMUX_AUTOQUIT" "false")

(exec-path-from-shell-initialize)
