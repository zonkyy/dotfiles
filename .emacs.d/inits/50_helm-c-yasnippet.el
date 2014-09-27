;;;; yasnippet の helm インターフェイス

(use-package helm-c-yasnippet
  :ensure helm-c-yasnippet)

(global-set-key (kbd "C-l C-y") 'helm-c-yas-complete)
