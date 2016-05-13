;;;; minor-mode のキーマップを強制的に変更


;;; 画面の分割と移動 (分割されていたら移動)
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p) (split-window-sensibly (get-buffer-window)))
  (other-window 1))


;;; 上に加えてC-uが付いていたら画面を閉じる
(defun other-window-or-split-or-close (arg)
  "画面が1つなら分割、2つ以上なら移動。
C-uをつけるとウィンドウを閉じる。"
  (interactive "p")
  (case arg
    (4  (delete-other-windows))
    (16 (delete-window))
    (t  (other-window-or-split))))


;;; キーマップ変更は下のコメントを評価してから define-minor-mode を再評価
;;; (makunbound 'overriding-minor-mode-map)
(define-minor-mode overriding-minor-mode
  "全てのマイナーモードマップを無視してキーを割り当てる"
  t                                     ; デフォルトで有効
  nil                                   ; モードライン
  `((, (kbd "C-q") . other-window-or-split-or-close)
    (, (kbd "C-S-q") . rotate-window)
    (, (kbd "M-h") . backward-kill-word)))


;;; 特定のモードで強制グローバルキーを設定しなおす
(add-hook 'minibuffer-setup-hook
          (lambda ()
            (overriding-minor-mode -1)
            (local-set-key (kbd "M-h") 'backward-kill-word)))
