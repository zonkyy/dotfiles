(use-package helm
  :ensure t
  :bind (("C-;" . helm-for-files)
         ("M-x" . helm-M-x)
         :map helm-map
         ("C-j" . helm-maybe-exit-minibuffer)
         ("C-;" . anything-keyboard-quit)))


(use-package helm-z
  :ensure t
  :bind (("M-+" . helm-z))
  :config
  ;; fish に無理矢理対応
  (defun helm-z-cd ()
    (call-process-shell-command (format "fish -c \"cd %s\"" (shell-quote-argument (dired-current-directory))))))
