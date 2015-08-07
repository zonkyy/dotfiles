;;;; カーソルを複製して同時編集

(use-package multiple-cursors
  :ensure t)


(global-unset-key (kbd "C-t"))
(smartrep-define-key global-map "C-t"
  '(("C-t"      . 'mc/mark-next-like-this)
    ("C-n"      . 'mc/mark-next-like-this)
    ("C-p"      . 'mc/unmark-next-like-this)
    ("C-k"      . 'mc/skip-to-next-like-this)
    ("*"        . 'mc/mark-all-like-this-dwim)
    ("C-a"      . 'mc/edit-beginnings-of-lines)
    ("C-e"      . 'mc/edit-ends-of-lines)
    ("C-s"      . 'mc/mark-all-in-region)
    ("M-n"      . 'mc/insert-numbers)))
