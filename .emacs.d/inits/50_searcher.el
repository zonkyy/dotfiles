(use-package ripgrep
  :ensure t
  :bind (("C-l g" . ripgrep-regexp))
  :config (setq ripgrep-arguments '("-S")))
