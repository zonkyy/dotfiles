;;; C での eldoc

(use-package c-eldoc)
(add-hook 'c-mode-common-hook 'c-turn-on-eldoc-mode)
