;;;; ローマ字で日本語をインクリメンタルサーチ


;;; 基本設定
;;; (package-install 'migemo)
(require 'migemo)
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))

;;; migemo-dict のパスを指定
(cond ((file-exists-p "/usr/share/migemo/utf-8/migemo-dict")
       (setq migemo-dictionary "/usr/share/migemo/utf-8/migemo-dict"))
      ((file-exists-p "/usr/share/cmigemo/utf-8/migemo-dict")
       (setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")))

(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)

;;; 辞書の文字コードを指定．
(setq migemo-coding-system 'utf-8-unix)

;;; ライブラリーのロードと初期化
(load-library "migemo")
(migemo-init)
