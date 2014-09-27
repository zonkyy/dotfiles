;;;; org-mode の基本設定

(use-package org-plus-contrib-autoloads
  :ensure org-plus-contrib)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-startup-truncated nil)
(setq org-return-follows-link t)
(setq org-hide-leading-stars t)


;;; 前置引数を付けて新しい見出しの階層を区別する設定
(defun org-insert-upheading (arg)
  "1レベル上の見出しを入力する。"
  (interactive "P")
  (org-insert-heading arg)
  (cond ((org-at-heading-p) (org-do-promote))
        ((org-at-item-p) (org-outdent-item))))

(mykie:global-set-key "C-:"
  :default (org-insert-heading nil)
  :C-u     (org-insert-subheading nil)
  :C-u*2   (org-insert-upheading nil))


;;; heading や list の途中に空行があっても insert-heading に影響させない
(setq org-blank-before-new-entry '((heading . nil)
                                   (plain-list-item . nil)))


;;; ハイパーリンク
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
