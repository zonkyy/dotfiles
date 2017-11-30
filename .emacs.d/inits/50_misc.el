(load-theme 'clarity t)

(setq
 ;; 警告音の代わりにウィンドウの上下 1 行ずつが反転
 visible-bell t
 ;; window 分割時、画面外に出る文章を折り返す
 truncate-partial-width-windows nil
 ;; オートセーブの場所を指定する
 backup-directory-alist `((".*" . ,(format "%s/auto-save-file" my-cache-dir)))
 auto-save-file-name-transforms `((".*" ,(format "%s/auto-save-file" my-cache-dir) t))
 auto-save-list-file-prefix (format "%s/auto-save-list/.saves-" my-cache-dir)
 ;; ロックファイルを作成しない
 create-lockfiles nil
 ;; C-vでスクロールした際，カーソルを一番上(下)に移動しない．
 scroll-preserve-screen-position t
 ;; 画面外にカーソルを移動した際 1 行ずつ移動
 scroll-conservatively 35
 scroll-margin 0
 scroll-step 1
 ;; find fileで大文字小文字を区別しない
 read-file-name-completion-ignore-case t
 ;; 履歴をたくさん保存する
 history-length 1000
 ;; キーストロークをエコーエリアに早く表示する
 echo-keystrokes 0.1
 ;; Lisp nesting exceeds max-lisp-eval-depth の防止
 max-lisp-eval-depth 1000
 ;; Variable binding depth exceeds max-specpdl-size の防止
 max-specpdl-size 6000
 ;; diff モードは最初は read-only にする
 diff-default-read-only t
 ;; ediff で新規ウィンドウを表示しない
 ediff-window-setup-function 'ediff-setup-windows-plain
 ;; ediff で最初から縦分割
 ediff-split-window-function 'split-window-horizontally
 ;; cookies ファイルの保存場所を変更
 url-cookie-file (format "%s/url/cookies" my-cache-dir)
 ;; fill-paragraph のエラーを防止
 kinsoku-limit 4
 ;; 内部での日付/時間表記は英語で行う
 system-time-locale "C"
 ;; C-i と TAB を別のキーとして扱う
 local-function-key-map (delq '(kp-tab . [9]) local-function-key-map)
 ;; 長いリストを全て出力
 eval-expression-print-length nil
 eval-expression-print-level nil)

;; タブ文字ではなくスペースでインデント
(setq-default indent-tabs-mode nil)

;; set-goal-column (C-x C-n) で選択画面を出さない
(put 'set-goal-column 'disabled nil)
;; narowing 禁止
(put 'narrow-to-region 'disabled nil)

;; yes or no を y or n に変更
(defalias 'yes-or-no-p 'y-or-n-p)
;; M-x exit で Emacs を終了する
(defalias 'exit 'save-buffers-kill-emacs)

;; font-lock (色) の設定
(global-font-lock-mode t)
;; 括弧を目立たせる
(show-paren-mode t)
;; 対応する括弧を自動入力
(electric-pair-mode t)
;; 行番号・桁番号を表示する
(line-number-mode 1)
(column-number-mode 1)
;; ツールバー、メニューバーを表示しない
(tool-bar-mode 0)
(menu-bar-mode 0)

;; 全角スペースの幅を 1 文字と認識される問題の修正
(set-language-environment "Japanese")

;; カーソル位置に応じた find-file
(ffap-bindings)

;; Commands History を永久保存
(setq desktop-dirname "~/.emacs.cache/"
      desktop-path (list desktop-dirname)
      desktop-globals-to-save '(extended-command-history)
      desktop-files-not-to-save "")
(desktop-save-mode 1)



(keyboard-translate ?\C-h ?\C-?)
(unbind-key "C-x C-z")
(unbind-key "C-l")
(bind-keys
 ("C-j" . newline-and-indent)
 ("C-x C-r" . revert-buffer)
 ("C-l C-l" . recenter-top-bottom)
 ("C-l R" . query-replace-regexp)
 ("C-l C-r" . query-replace))
(bind-keys*
 ("M-h" . backward-kill-word))
(bind-keys :map minibuffer-local-completion-map
           ("C-w" . backward-kill-word))



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
  (custom-set-variables `(recentf-save-file ,(format "%s/recentf" my-cache-dir)))
  (recentf-mode 1))
