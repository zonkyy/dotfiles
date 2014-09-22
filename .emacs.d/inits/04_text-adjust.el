;;;; 文章整形


;;; (auto-install-from-url "http://www.rubyist.net/~rubikitch/archive/mell.el")
;;; (auto-install-from-url "http://www.rubyist.net/~rubikitch/archive/text-adjust.el")
(require 'text-adjust)
;; 句読点はバッファごとに設定
(setq text-adjust-rule-kutouten nil)


;;; fill-paragraph を undo
(defun unfill-paragraph ()
  "Replace newline chars in current paragraph by single spaces.
This command does the reverse of `fill-paragraph'."
  (interactive)
  (let ((fill-column 90002000))
    (fill-paragraph nil)))

(defun unfill-region (start end)
  "Replace newline chars in region by single spaces.
This command does the reverse of `fill-region'."
  (interactive "r")
  (let ((fill-column 90002000))
    (fill-region start end)))


;;; M-q: fill-paragraph,  C-u M-q: unfill-paragraph
(mykie:set-keys nil
  "M-q"
  :default fill-paragraph
  :C-u!    unfill-paragraph
  "C-l q"
  :default text-adjust-buffer)
