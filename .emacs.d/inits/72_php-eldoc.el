;;;; PHP での eldoc

(use-package php-eldoc
  :ensure php-eldoc)


;;; auto-complete に関係するコードを除去
(defun php-eldoc-enable ()
  (interactive)
  (setq-local eldoc-documentation-function 'php-eldoc-function)
  (eldoc-mode 1))

(add-hook 'php-mode-hook 'php-eldoc-enable)
