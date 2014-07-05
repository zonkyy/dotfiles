;;;; recentf についての設定


(require 'recentf)

;; 最大保存数を拡張
(setq recentf-max-saved-items 2000)
;; recentf ファイルの保存場所を変更
(custom-set-variables '(recentf-save-file "~/.emacs.cache/recentf"))


;;; (package-install 'recentf-ext)
(require 'recentf-ext)

(recentf-mode 1)
(remove-hook 'kill-emacs-hook 'recentf-save-list)

;;; recentf 自動保存
(setq recentf-auto-cleanup 10)
(setq recentf-auto-save-timer
      (run-with-idle-timer 30 t 'recentf-save-list))
