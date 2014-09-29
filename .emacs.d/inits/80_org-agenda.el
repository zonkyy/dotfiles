;;;; org-mode の予定や TODO 関係する機能の設定

(setq org-log-done 'time)
(setq org-todo-keywords
       '((sequence "TODO" "|" "DONE" "DELEGATED")))
(global-set-key (kbd "C-*") 'org-insert-todo-heading)

(defun org-summary-todo (n-done n-not-done)
  "すべてのサブツリーが終了するとDONEに切り替え、その他の場合は、TODOにする。"
  (let (org-log-done org-log-states)
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
