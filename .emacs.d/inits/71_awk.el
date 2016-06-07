;;;; awk スクリプト用の設定


;;; hooks
(defun awk-mode-hooks ()
  (subword-mode 1))

(add-hook 'awk-mode-hook 'awk-mode-hooks)
