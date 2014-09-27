;;;; grep (ag) の結果結果を編集する

(use-package wgrep
  :ensure wgrep)
(use-package wgrep-ag
  :ensure wgrep-ag)

(define-key ag-mode-map (kbd "r") 'wgrep-change-to-wgrep-mode)
