;;;; org 文書でプログラムを実行


(use-package ob)
(setq org-confirm-babel-evaluate nil)
(setq org-edit-src-content-indentation 0)
(add-to-list 'org-babel-default-header-args '(:padline . "no"))

;;; 言語の指定
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (emacs-lisp . t)
   (haskell . t)
   (python . t)
   (ruby . t)
   (screen . t)
   (sh . t)
   (sql . t)
   (sqlite . t)
   (perl . t)))
