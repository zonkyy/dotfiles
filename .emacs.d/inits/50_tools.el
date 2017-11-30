


(use-package other-window-or-split
  :load-path "elisp"
  :bind* ("C-q" . other-window-or-split-or-close))


(use-package rotate
  :ensure t
  :bind
  ("C-S-q" . rotate-window)
  :config
  (defadvice rotate-window (after rotate-cursor activate)
    (other-window 1)))


(use-package whitespace
  :init
  (global-whitespace-mode 1)

  (setq
   ;; 強調したい要素
   whitespace-style '(space-mark tab-mark face spaces tabs trailing)
   ;; whitespace-space を全角スペースと定義
   whitespace-space-regexp "\\(\u3000+\\)"
   ;; 全角スペース，タブに使用する記号
   whitespace-display-mappings '((space-mark ?\u3000 [?□] [?_ ?_])
                                 (tab-mark     ?\t    [?^ ?\t] [?\\ ?\t])))

  ;; face 設定
  (set-face-attribute 'whitespace-space nil
                      :foreground "green"
                      :background 'unspecified)
  (set-face-attribute 'whitespace-tab nil
                      :foreground "purple"
                      :background 'unspecified
                      :underline t)
  (set-face-attribute 'whitespace-trailing nil
                      :foreground "purple"
                      :background 'unspecified
                      :underline t)

  ;; ファイル保存時に行末のスペースを除去
  (add-hook 'before-save-hook 'delete-trailing-whitespace))


(use-package recentf-ext
  :ensure t
  :init
  (setq recentf-max-saved-items 2000
        recentf-auto-cleanup 600
        recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))
  (custom-set-variables `(recentf-save-file ,(expand-file-name "recentf" my-cache-dir)))
  (recentf-mode 1))


(use-package redo+
  :ensure t
  :bind (("C-?" . redo))
  :init (setq undo-no-redo t
              undo-limit 600000
              undo-strong-limit 900000))


(use-package thingopt
  :ensure t
  :bind ("C-@" . mark-word*)

  :config
  (define-thing-commands))
