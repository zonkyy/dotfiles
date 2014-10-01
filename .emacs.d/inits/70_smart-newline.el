;;; カーソルの位置に合った改行を行う

(use-package smart-newline
  :ensure smart-newline)


;;; smart-newline を使用するモード
(dolist (hook '(ruby-mode-hook
                emacs-lisp-mode-hook
                org-mode-hook))
  (add-hook hook 'smart-newline-mode))
