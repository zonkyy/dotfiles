;;; SQL 用の設定

(add-hook 'sql-mode-hook
          (lambda ()
            (sql-highlight-mysql-keywords)))
