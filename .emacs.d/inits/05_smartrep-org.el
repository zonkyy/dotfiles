;;;; org-mode の見出し移動

(eval-after-load "org"
  '(progn
     (smartrep-define-key
         org-mode-map "C-c" '(("C-n" . (lambda ()
                                         (outline-next-visible-heading 1)))
                              ("C-p" . (lambda ()
                                         (outline-previous-visible-heading 1)))))))
