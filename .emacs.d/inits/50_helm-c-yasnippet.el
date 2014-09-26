;;;; yasnippet の helm インターフェイス


;;; (package-install 'helm-c-yasnippet)
(use-package helm-c-yasnippet)

(global-set-key (kbd "C-l C-y") 'helm-c-yas-complete)
