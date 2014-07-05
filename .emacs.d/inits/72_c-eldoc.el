;;; C での eldoc

(require 'c-eldoc)
(add-hook 'c-mode-common-hook 'c-turn-on-eldoc-mode)
