;;;; 変数などのシンボルをハイライト

(use-package auto-highlight-symbol
  :ensure auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)


;;; リージョン選択中はハイライトしない
(defun ahs-exclude-function (sym)
  (use-region-p))
(setq ahs-exclude 'ahs-exclude-function)
