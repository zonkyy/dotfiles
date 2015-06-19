;;;; isearch 起動時、文字数に合わせて ace-jump-mode や helm-swoop に切り替える

(use-package ace-isearch
  :ensure ace-isearch)

(global-ace-isearch-mode 1)
(setq ace-isearch-input-idle-jump-delay 0.2)
