(use-package magit
  :ensure t
  :bind (("C-x v d" . magit-status)
         :map magit-mode-map
         ("e" . magit-ediff-show-staged-or-unstaged))

  :init
  (defun magit-ediff-show-staged-or-unstaged ()
    (interactive)
    (pcase (magit-diff--dwim)
      (`unstaged (magit-ediff-show-unstaged (magit-current-file)))
      (`staged (magit-ediff-show-staged (magit-current-file)))
      (_
       (message "Can't ediff this file.")))))
