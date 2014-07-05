;;;; awk スクリプト用の設定


;;; hooks
(defun awk-mode-hooks ()
  (subword-mode 1)
  ;; keybind
  (local-set-key (kbd "C-c c") 'smart-compile)
  (local-set-key (kbd "C-c C-c") (kbd "C-c c C-m")))

(add-hook 'awk-mode-hook 'awk-mode-hooks)
