(use-package org
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c b" . org-iswitchb))

  :config
  (use-package org-plus-contrib
    :ensure t)

  (setq org-startup-truncated nil
        org-hide-leading-stars t
        org-blank-before-new-entry '((heading . nil)
                                     (plain-list-item . nil)))

  (defun org-insert-subheading-or-subitem (arg)
    "1レベル下の見出し/リストを入力する。"
    (interactive "P")
    (cond ((org-in-item-p)
           (org-insert-item)
           (org-indent-item))
          (t
           (org-insert-heading)
           (org-do-demote))))

  (defun org-insert-upheading-or-upitem (arg)
    "1レベル上の見出し/リストを入力する。"
    (interactive "P")
    (cond ((org-in-item-p)
           (org-insert-item)
           (org-outdent-item))
          (t
           (org-insert-heading)
           (org-do-promote))))

  (mykie:global-set-key "C-:"
    :default (org-meta-return nil)
    :C-u     (org-insert-subheading-or-subitem nil)
    :C-u*2   (org-insert-upheading-or-upitem nil)))
