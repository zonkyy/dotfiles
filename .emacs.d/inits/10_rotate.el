;;;; 分割した画面の位置をローテートする


;;; (auto-install-from-url "https://raw.github.com/daic-h/emacs-rotate/master/rotate.el")
(require 'rotate)

;;; ローテート後のカーソル位置をローテート前のバッファと同じにする
(defadvice rotate-window (after rotate-cursor activate)
  (other-window 1))
