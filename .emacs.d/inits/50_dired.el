(use-package dired
  :bind
  (:map dired-mode-map
        ("." . dired-dwim-up-alternate-directory)
        ("RET" . dired-find-file-other-window)
        ("C-j" . dired-dwim-find-alternate-file)
        ("q" . dired-dwim-quit-window)
        ("r" . wdired-change-to-wdired-mode))
  
  
  :init
  (require 'dired-x)

  (defun dired-dwim-find-alternate-file ()
    "画面分割に適した `dired-find-alternate-file'"
    (interactive)
    (cond
     ;; 同じバッファが他のwindowにある場合
     ((delq (selected-window) (get-buffer-window-list))
      (dired-find-file))
     ;; 同じバッファが他のwindowにない場合
     (t
      (dired-find-alternate-file))))

  (defun dired-up-alternate-directory ()
    "バッファを増やさず上のディレクトリに移動"
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
    "画面分割に適した `dired-up-alternate-directory'"
    (interactive)
    (cond
     ;; 同じバッファが他のwindowにある場合
     ((delq (selected-window) (get-buffer-window-list))
      (dired-up-directory))
     ;; 同じバッファが他のwindowにない場合
     (t
      (dired-up-alternate-directory))))

  
  :config
  ;; ファイルを削除したらゴミ箱へ
  (setq delete-by-moving-to-trash t)
  ;; コピーと削除を再帰で
  (setq dired-recursive-copies 'always)
  (setq dired-recursive-deletes 'always)
  ;; 2 画面なら他方にコピー
  (setq dired-dwim-target t)
  ;; ls のオプション変更
  (setq dired-listing-switches "-GFlhLA --group-directories-first")
  ;; 新規バッファを生成しない
  (put 'dired-find-alternate-file 'disabled nil)

  (defun dired-dwim-quit-window ()
    "画面分割に適した `quit-window'"
    (interactive)
    (quit-window (not (delq (selected-window) (get-buffer-window-list))))))
