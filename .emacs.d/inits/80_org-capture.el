;;; org-mode でメモを取る org-capture の設定

(use-package org-capture)

(use-package skk-vars)
(defun today-string ()
  (skk-current-date
   (lambda (date-information format gengo and-time)
     (skk-default-current-date date-information nil 0 'gengo 0 0 0))))


;;; テンプレート
(setq org-capture-templates
      `(("t" "todo" entry
         (file+datetree "~/documents/notes/todo.org")
         "* TODO %?"
         :unnarrowed t)
        ("l" "lifelog" plain
         (file+datetree "~/documents/notes/lifelog.org" ,(today-string))
         nil
         :unnarrowed t)
        ("p" "PHP Manual" plain
         (file+datetree "~/documents/notes/php.org" ,(today-string))
         "**** PHP マニュアル ( まで)\n     - %?"
         :unnarrowed t)
        ("d" "daily report" plain
         (file (format-time-string "~/documents/daily_reports/%Y-%m-%d.org" (current-time)))
         (file "~/documents/daily_reports/template.org"))))

(global-set-key (kbd "C-z") 'org-capture)
