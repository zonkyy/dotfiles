;;;; 一時表示バッファを C-g で簡単に消す


;;; (package-install 'popwin)
(use-package popwin)

(popwin-mode 1)
;; ポップアップの大きさ
(setq popwin:popup-window-height 0.5)
;;  文字のちらつき防止
(setq popwin:close-popup-window-timer-interval 0.5)
