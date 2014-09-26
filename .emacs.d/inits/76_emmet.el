;;;; ZenCoding を CSS でも行う emmet-mode


;;; (package-install 'emmet-mode)
(use-package emmet-mode)

(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)

(define-key emmet-mode-keymap (kbd "C-m") 'emmet-expand-line)
(define-key emmet-mode-keymap (kbd "C-j") 'newline-and-indent)
