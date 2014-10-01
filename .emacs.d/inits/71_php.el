;;; PHP 用の設定

(use-package php-mode
  :ensure php-mode)


(defun php-mode-hooks ()
  (php-enable-psr2-coding-style)
  (ggtags-mode)
  (php-eldoc-enable)

  ;; php-mode で削除されるので再定義
  (add-hook 'before-save-hook 'delete-trailing-whitespace))

(add-hook 'php-mode-hook 'php-mode-hooks)
