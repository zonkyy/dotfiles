;;;; ローマ字で日本語をインクリメンタルサーチ


;;; 基本設定
(use-package migemo
  :ensure migemo)
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))

;;; migemo-dict のパスを指定 (環境変数 MIGEMO-DICT-PATH を取得)
(use-package exec-path-from-shell
  :ensure exec-path-from-shell)
(setq migemo-dictionary (exec-path-from-shell-copy-env "MIGEMO_DICT_PATH"))

(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)

;;; 辞書の文字コードを指定．
(setq migemo-coding-system 'utf-8-unix)

;;; ライブラリーのロードと初期化
(load-library "migemo")
(migemo-init)
