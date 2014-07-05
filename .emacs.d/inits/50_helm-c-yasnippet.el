;;;; yasnippet の helm インターフェイス


;;; (package-install 'helm-c-yasnippet)
(require 'helm-c-yasnippet)

(global-set-key (kbd "C-l C-y") 'helm-c-yas-complete)
