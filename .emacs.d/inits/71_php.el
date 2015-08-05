;;; PHP 用の設定

(use-package php-mode
  :ensure php-mode)

(use-package php-auto-yasnippets
  :ensure t)


(defun php-mode-hooks ()
  (php-enable-psr2-coding-style)
  (ggtags-mode)

  ;; flycheck
  (flycheck-mode t)

  ;; keybind
  (local-set-key (kbd "C-c c") 'smart-compile)
  (local-set-key (kbd "C-c C-c") (kbd "C-c c C-m"))
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (local-set-key (kbd "<tab>") 'yas/create-php-snippet)

  ;; php-mode で削除されるので再定義
  (add-hook 'before-save-hook 'delete-trailing-whitespace))

(add-hook 'php-mode-hook 'php-mode-hooks)
