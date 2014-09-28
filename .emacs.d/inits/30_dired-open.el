;;; 関連付けされたプログラムに従ってファイルを開く

(use-package dired-open
  :ensure dired-open)

(define-key dired-mode-map (kbd "o") 'dired-open-xdg)
