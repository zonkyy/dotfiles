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
    ("M-n"      . 'my/mc/insert-numbers)))


;; CUA モードのような連番挿入機能を追加
(defvar my/mc/insert-numbers-hist nil)
(defvar my/mc/insert-numbers-inc 1)
(defvar my/mc/insert-numbers-pad "%01d")

(defun my/mc/insert-numbers (start inc pad)
  "Insert increasing numbers for each cursor specifically."
  (interactive
   (list (read-number "Start from: " 0)
         (read-number "Increment by: " 1)
         (read-string "Padding (%01d): " nil my/mc/insert-numbers-hist "%01d")))
  (setq mc--insert-numbers-number start)
  (setq my/mc/insert-numbers-inc inc)
  (setq my/mc/insert-numbers-pad pad)
  (mc/for-each-cursor-ordered
   (mc/execute-command-for-fake-cursor
    'my/mc--insert-number-and-increase
    cursor)))

(defun my/mc--insert-number-and-increase ()
  (interactive)
  (insert (format my/mc/insert-numbers-pad mc--insert-numbers-number))
  (setq mc--insert-numbers-number (+ mc--insert-numbers-number my/mc/insert-numbers-inc)))
