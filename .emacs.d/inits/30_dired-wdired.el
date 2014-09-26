;;;; dired バッファを編集する wdired の設定

(use-package dired)
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)))
