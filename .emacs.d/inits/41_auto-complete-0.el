;;;; ポップアップ補完を行う Auto Complete

(use-package auto-complete-config
  :ensure auto-complete)
;; ポップアップ出力時専用のキーマップを有効にするか
(setq ac-use-menu-map t)
;; 大文字を入力したときのみ case を区別
(setq ac-ignore-case 'smart)
;; 特定のフェイスで補完を無効にしない
(setq ac-disable-faces nil)
;; ac-comphist.dat の場所を指定
(setq ac-comphist-file "~/.emacs.cache/ac-comphist.dat")
