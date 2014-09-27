;;;; redo と undo に異なるコマンドを割り当てる

(use-package redo+
  :ensure redo+)
(global-set-key (kbd "C-?") 'redo)
;; 過去の undo を redo しない
(setq undo-no-redo t)
;; 大量のundoに耐える
(setq undo-limit 600000)
(setq undo-strong-limit 900000)
