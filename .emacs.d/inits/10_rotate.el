;;;; 分割した画面の位置をローテートする

(use-package rotate
  :ensure rotate)

;;; ローテート後のカーソル位置をローテート前のバッファと同じにする
(defadvice rotate-window (after rotate-cursor activate)
  (other-window 1))
