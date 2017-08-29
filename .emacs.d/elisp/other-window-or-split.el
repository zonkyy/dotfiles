(require 'cl)

(defvar ignore-window-regexp "\\*\\(locals\\|input/output\\|stack frames\\|breakpoints\\) of .*\\*")
(defun next-window-except-ignore-window ()
  (interactive)
  (let* ((window (selected-window))
         (old-window window)
         (found-p nil))
    (while (not found-p)
      (setq window (next-window window))
      (cond
       ((eq old-window window)
        (setq found-p t))
       ((string-match ignore-window-regexp (buffer-name (window-buffer window))))
       (t
        (setq found-p t))))
    (select-window window)
    nil))

(defun other-window-or-split ()
  (interactive)
  (when (one-window-p) (split-window-sensibly (get-buffer-window)))
  (next-window-except-ignore-window))

(defun other-window-or-split-or-close (arg)
  (interactive "p")
  (case arg
    (4  (delete-other-windows))
    (16 (delete-window))
    (t  (other-window-or-split))))

(provide 'other-window-or-split)
