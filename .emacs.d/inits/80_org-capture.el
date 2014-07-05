;;; org-mode でメモを取る org-capture の設定


(require 'org-capture)


;;; テンプレート
(setq org-capture-templates
      '(("a" "Arch Linux Memo" plain
         (file "~/Dropbox/documents/org/memo/arch.org")
         nil
         :immediate-finish t :jump-to-captured t)
        ("s" "Ubuntu Server Memo" plain
         (file "~/Dropbox/documents/org/memo/ubuntuserver.org")
         nil
         :immediate-finish t :jump-to-captured t)
        ("w" "Want to do" plain
         (file "~/Dropbox/wanttodo.org")
         nil
         :immediate-finish t :jump-to-captured t)
        ("l" "Lab Memo" plain
         (file (format "~/Dropbox/lab/memo/%s.org"
                       (skk-default-current-date (skk-current-date-1) nil 0 t 0 0 0)))
         nil
         :immediate-finish t :jump-to-captured t)
        ("b" "Blog" plain
         (file (format-time-string "~/Dropbox/documents/org/blog/%Y-%m-%d.org" (current-time)))
         (file "~/Dropbox/documents/org/blog/template.org")
         :immediate-finish t :jump-to-captured t)
        ("n" "Blog Memo" plain
         (file "~/Dropbox/documents/org/blog/neta.org")
         nil
         :immediate-finish t :jump-to-captured t)
        ("q" "Qiita" plain
         (file (format-time-string "~/Dropbox/documents/org/qiita/%Y-%m-%d.org" (current-time)))
         nil
         :immediate-finish t :jump-to-captured t)))

(global-set-key (kbd "C-z") 'org-capture)
