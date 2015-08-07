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


;;; magit-status の 'e' を 3 画面から 2 画面に変更
(defun magit-ediff-show-staged-or-unstaged ()
  (interactive)
  (pcase (magit-diff--dwim)
    (`unstaged (magit-ediff-show-unstaged (magit-current-file)))
    (`staged (magit-ediff-show-staged (magit-current-file)))
    (_
     (message "Can't ediff this file."))))

(define-key magit-mode-map (kbd "e") 'magit-ediff-show-staged-or-unstaged)
