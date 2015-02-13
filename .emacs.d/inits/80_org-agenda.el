;;;; org-mode の予定や TODO 関係する機能の設定

(use-package org-agenda)
(setq org-log-done 'time)
(setq org-todo-keywords
       '((sequence "TODO(t)" "WAIT(w)" "SOMEDAY(s)" "|" "DONE(d)" "DELEGATED(g)")))
(global-set-key (kbd "C-*") 'org-insert-todo-heading)
(setq org-agenda-files '("~/documents/notes/todo.org"))
(setq org-priority-start-cycle-with-default nil)


;;; org-agenda の並び順
(setq org-agenda-sorting-strategy
  '((agenda habit-down time-up priority-down category-keep)
    (todo   todo-state-up priority-down category-keep)
    (tags   priority-down category-keep)
    (search category-keep)))

;;; agenda 表示のショートカット
(global-set-key (kbd "C-l c") '(lambda () (interactive) (org-agenda nil "n")))

;;; コマンド一発で DONE にする
(define-key org-mode-map (kbd "C-l d") (kbd "C-c C-t d"))
(define-key org-agenda-mode-map (kbd "C-l d") (kbd "C-c C-t d"))

;;; C-c C-c * RET の RET 入力が面倒なので C-l t * で一発で済ませられるショートカット導入
(define-key org-mode-map (kbd "C-l t") nil)
(loop for c from ?a to ?z do
      (define-key org-mode-map (kbd (format "C-l t %c" c)) (kbd (format "C-c C-c %c RET" c))))
(define-key org-mode-map (kbd "C-l t SPC") (kbd "C-c C-c SPC RET"))

;;; C-c C-c で agenda の save & update
(define-key org-agenda-mode-map (kbd "C-c C-c")
  '(lambda ()
     (interactive)
     (org-save-all-org-buffers)
     (org-agenda-redo t)))

;;; agenda を開いた後にカーソルを好みの場所に移動 (C-c a n のみ対応)
(defadvice org-agenda (after org-agenda-move-cursor activate)
  (search-forward "Global list of TODO items of type: ALL\n" nil t))
