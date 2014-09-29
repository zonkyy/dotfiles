;;; PHP 用の設定

(use-package php-mode
  :ensure php-mode)
(use-package web-mode
  :ensure web-mode)


(defun php-mode-hooks ()
  (php-enable-psr2-coding-style)

  ;; php-mode で削除されるので再定義
  (add-hook 'before-save-hook 'delete-trailing-whitespace))

(add-hook 'php-mode-hook 'php-mode-hooks)


(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
