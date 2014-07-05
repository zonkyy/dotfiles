;;;; SKK モードの基本設定


(add-to-list 'load-path "/usr/local/share/emacs/24.3/site-lisp/skk")
(setq skk-user-directory "~/.emacs.d/ddskk/")
(require 'skk-autoloads)


;;; isearch では SKK を使用しない for migemo
(setq skk-isearch-state-mode 'latin)


;;; SKK モードでファイルを開く
(defun skk-find-file-hooks ()
  (skk-mode)
  (skk-latin-mode-on))
(add-hook 'find-file-hooks 'skk-find-file-hooks)


;; 1. C-i が skk-insert のせいで，transient-mark-mode 時のリージョンが
;; 入力と同時に削除される問題を修正
;; 2. Q で ▽ と同時に「ん」が入力される問題を修正
;; 3. X で辞書を削除できないため，代わりに C-DEL で削除できるよう修正
(defadvice skk-setup-j-mode-map-options (after c-i-comp-wrapper2 activate)
  (define-key skk-j-mode-map (kbd "C-i") #'skk-comp-wrapper)
  (define-key skk-j-mode-map (kbd "Q") #'skk-set-henkan-point-subr)
  (define-key skk-j-mode-map (kbd "C-<delete>") #'skk-purge-from-jisyo))
