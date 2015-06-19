;;;; シェルの環境変数を Emacs で使用する

(use-package exec-path-from-shell
  :ensure exec-path-from-shell)

(exec-path-from-shell-initialize)
