;;;; grep (ag) の結果結果を編集する

;;; (package-install 'wgrep)
;;; (package-install 'wgrep-ag)
(require 'wgrep)
(require 'wgrep-ag)

(define-key ag-mode-map (kbd "r") 'wgrep-change-to-wgrep-mode)
