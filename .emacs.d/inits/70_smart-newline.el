;;; カーソルの位置に合った改行を行う


(require 'smart-newline)
(global-set-key (kbd "C-m") 'smart-newline)

;;; smart-newline を使用するモード
(dolist (hook '(ruby-mode-hook
                emacs-lisp-mode-hook
                org-mode-hook))
  (add-hook hook 'smart-newline-mode))
