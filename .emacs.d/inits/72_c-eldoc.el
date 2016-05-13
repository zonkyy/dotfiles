;;; C での eldoc

(use-package c-eldoc
  :ensure t)
(add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode)
