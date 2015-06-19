;;;; Linux 用の設定


;;; 言語・文字コード関連の設定
(prefer-coding-system 'utf-8)


;;; フォント設定
(set-frame-font "ricty-10.5")
(set-fontset-font t 'unicode "ricty" nil 'prepend)


;;; テーマ (.emacs.d に配置)
;; https://raw.githubusercontent.com/emacs-jp/replace-colorthemes/master/clarity-theme.el
(load-theme 'clarity t)


;;; emacsclientw.exe を使用して外部からemacsにファイルを渡せるようにする
(use-package server)
(or (server-running-p) (server-start))


;;; コピー/ペースト をクリップボードと共有
(setq x-select-enable-clipboard t)
(global-set-key (kbd "C-y") 'x-clipboard-yank)
