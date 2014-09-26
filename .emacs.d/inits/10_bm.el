;;;; 現在のカーソル位置を記憶


;;; (install-package 'bm)
(setq bm-restore-repository-on-load t)
(use-package bm)

;;; face 設定
(setq bm-highlight-style 'bm-highlight-only-fringe)
(setq bm-fringe-persistent-face 'bm-fringe-face)

;;; キー設定
(global-set-key (kbd "M-[") 'bm-previous)
(global-set-key (kbd "M-]") 'bm-next)
(global-set-key (kbd "C-l SPC") 'bm-toggle)

;;; bm 保存設定
(setq-default bm-buffer-persistence t)
(add-hook 'kill-buffer-hook 'bm-buffer-save)
(add-hook 'kill-emacs-hook '(lambda nil
                              (bm-buffer-save-all)
                              (bm-repository-save)))
(add-hook 'after-save-hook 'bm-buffer-save)

;;; bm ロード設定
(add-hook' after-init-hook 'bm-repository-load)
(add-hook 'find-file-hooks 'bm-buffer-restore)
(add-hook 'after-revert-hook 'bm-buffer-restore)
