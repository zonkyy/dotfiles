;;;; Haskell 用の設定

(use-package haskell-mode
  :ensure haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;;; flycheck
(add-hook 'haskell-mode-hook 'flycheck-mode)
