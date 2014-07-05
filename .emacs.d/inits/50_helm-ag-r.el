;;; helm インターフェイスで ag を利用する

(require 'helm-ag-r)

(setq helm-ag-r-google-contacts-user "")
(setq helm-ag-r-google-contacts-lang "ja_JP.UTF-8")
(setq helm-ag-r-requires-pattern 3)
(setq helm-ag-r-input-idle-delay 0.1)
(setq helm-ag-r-candidate-limit 1000)
(setq helm-ag-r-option-list '("-S -U --hidden" "-S -U -g"))

(global-set-key (kbd "C-l a") 'helm-ag-r)
