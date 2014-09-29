;;;; YAML 用の設定

(use-package yaml-mode
  :ensure yaml-mode)

(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))
