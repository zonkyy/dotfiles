;;;; Emacs で Git を使用する


;;; (package-install 'magit)
(use-package magit)
(global-set-key (kbd "C-x v d") 'magit-status)
(global-set-key (kbd "C-x v L") 'magit-key-mode-popup-logging)
(global-set-key (kbd "C-x v z") 'magit-stash)
(define-key magit-mode-map "\M-l" "l-all")
