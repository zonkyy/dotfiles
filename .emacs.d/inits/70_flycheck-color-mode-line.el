;;;; flycheck における色設定

(use-package flycheck-color-mode-line
  :ensure flycheck-color-mode-line)
(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

;;; モードラインのフェイス変更
(set-face-foreground 'flycheck-color-mode-line-error-face "red")
(set-face-foreground 'flycheck-color-mode-line-warning-face "yellow")

;;; flycheck のフェイス変更
(set-face-underline 'flycheck-warning '(:style wave :color "red4"))
