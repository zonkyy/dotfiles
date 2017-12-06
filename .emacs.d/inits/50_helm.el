(use-package helm
  :ensure t
  :bind (("C-;" . helm-for-files)
         ("M-x" . helm-M-x)
         :map helm-map
         ("C-j" . helm-maybe-exit-minibuffer)
         ("C-;" . anything-keyboard-quit)))


(use-package helm-z
  :ensure t
  :bind (("M-+" . helm-z)))
