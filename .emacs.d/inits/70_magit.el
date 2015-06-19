;;;; Emacs で Git を使用する

(use-package magit
  :ensure magit)
(global-set-key (kbd "C-x v d") 'magit-status)
(global-set-key (kbd "C-x v L") 'magit-key-mode-popup-logging)
(global-set-key (kbd "C-x v z") 'magit-stash)
(define-key magit-mode-map "\M-l" "l-all")
(setq magit-auto-revert-mode nil)
(setq magit-last-seen-setup-instructions "1.4.0")


;;; magit で git-svn のコマンドを使用する
(use-package magit-svn
  :ensure magit-svn)
(add-hook 'magit-mode-hook 'magit-svn-mode)
