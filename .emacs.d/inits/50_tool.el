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


(use-package undo-tree
  :ensure t
  :config (global-undo-tree-mode))


(use-package thingopt
  :ensure t
  :bind ("C-@" . mark-word*)

  :config
  (define-thing-commands))


(use-package open-junk-file
  :ensure t
  :bind (("C-x j" . open-junk-file)
         ("C-x J" . open-junk-file-open-last-file)
         ("C-x M-j" . open-junk-file-open-file-by-helm))

  :init
  (setq open-junk-file-format "~/junk/%Y/%m/%Y-%m-%d-%H%M%S."
        ;; 別ウィンドウではなく現在のウィンドウに開く
        open-junk-file-find-file-function 'find-file)

  (use-package em-glob)
  (defun open-junk-file-reversed-file-list ()
    (reverse (eshell-extended-glob (expand-file-name "*/*/????-??-??-??????.*" "~/junk"))))

  ;; 一番新しい junk ファイルを開く
  (defun open-junk-file-open-last-file ()
    (interactive)
    (find-file (car (open-junk-file-reversed-file-list))))

  ;; junk ファイルを helm で選択する
  (defun open-junk-file-open-file-by-helm ()
      (interactive)
      (helm :sources (helm-build-sync-source "Junk files"
                       :candidates (open-junk-file-reversed-file-list)
                       :action 'helm-type-file-actions)
            :buffer "*Helm junk file source*")))


(use-package git-gutter+
  :ensure t
  :init (global-git-gutter+-mode t))


(use-package pcre2el
  :ensure t
  :bind ("C-l r" . pcre-query-replace-regexp)

  :init
  (setq reb-re-syntax 'pcre)
  (add-hook 'prog-mode-hook 'rxt-mode))
