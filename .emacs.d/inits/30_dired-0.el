;;;; dired の設定・拡張


(use-package dired)
(use-package dired-x)

;; ファイルを削除したらゴミ箱へ
(setq delete-by-moving-to-trash t)
;; コピーと削除を再帰で
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)
;; 2画面なら他方にコピー
(setq dired-dwim-target t)
;; ls のオプション変更
(setq dired-listing-switches "-GFlhLA --group-directories-first")
;; 新規バッファを生成しない
(put 'dired-find-alternate-file 'disabled nil)


(defun dired-dwim-find-alternate-file ()
  "画面分割に適した `dired-find-alternate-file'．
通常は `dired-find-alternate-file' を行うが，画面分割されていて
他方のウィンドウに同じバッファが表示されていれば `dired-find-file'．"
  (interactive)
  (cond
   ;; 同じバッファが他のwindowにある場合
   ((delq (selected-window) (get-buffer-window-list))
    (dired-find-file))
   ;; 同じバッファが他のwindowにない場合
   (t
    (dired-find-alternate-file))))


(defun dired-up-alternate-directory ()
  "バッファを増やさず上のディレクトリに移動．"
  (interactive)
  (let* ((dir (dired-current-directory))
         (up (file-name-directory (directory-file-name dir))))
    (or (dired-goto-file (directory-file-name dir))
        ;; Only try dired-goto-subdir if buffer has more than one dir.
        (and (cdr dired-subdir-alist)
             (dired-goto-subdir up))
        (progn
          (find-alternate-file up)
          (dired-goto-file dir)))))


(defun dired-dwim-up-alternate-directory ()
  "画面分割に適した `dired-up-alternate-directory'．"
  (interactive)
  (cond
   ;; 同じバッファが他のwindowにある場合
   ((delq (selected-window) (get-buffer-window-list))
    (dired-up-directory))
   ;; 同じバッファが他のwindowにない場合
   (t
    (dired-up-alternate-directory))))


(defun dired-dwim-quit-window ()
  "画面分割に適した `quit-window'．"
  (interactive)
  (quit-window (not (delq (selected-window) (get-buffer-window-list)))))


(defun dired-xdg-open ()
  "Nautilus の関連付けでファイルを開く"
  (interactive)
  (let* ((file (dired-get-filename)))
    (call-process "xdg-open" nil 0 nil file)))


(defadvice dired-copy-filename-as-kill (before four-prefix activate)
  "C-u w でフルパス killing"
  (interactive "P")
  (when (eq 4 (prefix-numeric-value (ad-get-arg 0)))
    (ad-set-arg 0 0)))


(defvar dired-step-line-num 10)

(defun dired-step-next-line ()
  (interactive)
  (dired-next-line dired-step-line-num))

(defun dired-step-previous-line ()
  (interactive)
  (dired-previous-line dired-step-line-num))


(defun dired-mode-hooks ()
  ;; dired キーバインド
  (define-key dired-mode-map (kbd ".") 'dired-dwim-up-alternate-directory)
  (define-key dired-mode-map (kbd "RET") 'dired-find-file-other-window)
  (define-key dired-mode-map (kbd "C-j") 'dired-dwim-find-alternate-file)
  (define-key dired-mode-map (kbd "SPC") 'dired-toggle-mark)
  (define-key dired-mode-map (kbd "o") 'dired-xdg-open)
  (define-key dired-mode-map (kbd "q") 'dired-dwim-quit-window)
  (define-key dired-mode-map (kbd "n") 'dired-step-next-line)
  (define-key dired-mode-map (kbd "p") 'dired-step-previous-line))
(add-hook 'dired-mode-hook 'dired-mode-hooks)
