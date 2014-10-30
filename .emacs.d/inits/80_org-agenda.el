;;;; org-mode の予定や TODO 関係する機能の設定

(setq org-log-done 'time)
(setq org-todo-keywords
       '((sequence "TODO" "|" "DONE" "DELEGATED")))
(global-set-key (kbd "C-*") 'org-insert-todo-heading)
