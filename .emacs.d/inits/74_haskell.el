;;;; Haskell 用の設定


;;; (package-install 'haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;;; flycheck
(add-hook 'haskell-mode-hook 'flycheck-mode)
