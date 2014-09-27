;;; helm インターフェイスで ag を利用する

(use-package helm-ag
  :ensure helm-ag)
(setq helm-ag-base-command "ag --nocolor --nogroup --ignore-case")

(global-set-key (kbd "C-l m") 'helm-do-ag)
