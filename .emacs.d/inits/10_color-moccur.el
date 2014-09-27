;;;; バッファ・ディレクトリ内検索

(use-package color-moccur
  :ensure color-moccur)
(setq moccur-split-word t)
(setq guide-key/popup-window-position 'bottom)
(setq moccur-use-migemo t)


(defun dmoccur-alternate (dir regexp)
  "`dmoccur-list' を用いた検索を行う"
  (interactive (list (dmoccur-read-from-minibuf t)
                     (moccur-regexp-read-from-minibuf)))
  (dmoccur dir regexp t))


;;; M-u M-x dmoccur で検索するディレクトリ
(setq dmoccur-list
      '(("blog" "~/Dropbox/documents/org/blog/" (".org") nil)
        ("memo" "~/Dropbox/documents/org/memo/" (".org") nil)
        ("qiita" "~/Dropbox/documents/org/qiita/" (".org") nil)
        ("reading" "~/Dropbox/documents/org/reading/" (".org") nil)
        ("org" "~/Dropbox/documents/org/" (".org") nil)
        ("elisp" "~/Dropbox/dotfiles/.emacs.d/inits/" (".el") nil)))


(global-set-key (kbd "C-l o") 'dmoccur)
(global-set-key (kbd "C-l k") 'clean-dmoccur-buffers)
