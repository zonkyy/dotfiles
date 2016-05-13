;;; org-mode でメモを取る org-capture の設定

(use-package org-capture)

;;; skk-funcs.el でオーバーライドされる
(defun today-string ())


;;; テンプレート
(setq org-capture-templates
      `(("t" "todo" entry
         (file+datetree "~/documents/notes/todo.org")
         "* TODO %? %^g")
        ("l" "lifelog" plain
         (file+datetree "~/documents/notes/lifelog.org" ,(today-string))
         nil
         :unnarrowed t)
        ("c" "config" plain
         (file+datetree "~/documents/notes/config.org" ,(today-string))
         nil
         :unnarrowed t)
        ("p" "PHP Manual" plain
         (file+datetree "~/documents/notes/php.org" ,(today-string))
         "**** PHP マニュアル ( まで)\n     - %?"
         :unnarrowed t)
        ("s" "Self Development" entry
         (file+datetree "~/documents/notes/self_development.org")
         "* %?"
         :unnarrowed t)
        ("d" "daily report" plain
         (file (format-time-string "~/documents/daily_reports/%Y-%m-%d.org" (current-time)))
         (file "~/documents/daily_reports/template.org"))))

(global-set-key (kbd "C-z") 'org-capture)
