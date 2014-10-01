;;; C での eldoc

(use-package c-eldoc)
(add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode)
