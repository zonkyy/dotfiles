;;; SQL 用の設定

(use-package edbi
  :ensure t)

;;; 全件 SELECT は時間がかかるので 1000 件に絞る
(defun edbi:dbview-show-data-sql (conn table-name)
  (if edbi:dbview-show-table-data-default-limit
      (edbi:dbd-limit-format-fill
       (edbi:dbd-get conn) table-name
       edbi:dbview-show-table-data-default-limit)
    (format "SELECT * FROM %s LIMIT 1000" table-name)))


(defun sql-mode-hooks ()
  (sql-highlight-mysql-keywords)
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (setq indent-line-function (quote insert-tab)))
(add-hook 'sql-mode-hook 'sql-mode-hooks)
