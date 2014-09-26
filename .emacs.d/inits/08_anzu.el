;;;; 検索コマンド実行中にマッチする語数と現在のマッチ位置表示


;;; (package-install 'anzu)
(use-package anzu)
(global-anzu-mode +1)

;;; migemo を利用
(setq anzu-use-migemo t)
;;; これ以上マッチする語数を数え上げない
(setq anzu-search-threshold 300)
;;; この文字以上入力したときに数え上げを行う
(setq anzu-minimum-input-length 3)
