;;; JavaScript 用の設定

(use-package js2-mode
  :ensure js2-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
