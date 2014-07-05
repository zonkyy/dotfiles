;;;; 標準コマンドのキー割り当て


;;; サスペンドしない
(global-unset-key (kbd "C-x C-z"))

;;; C-h にバックスペース
(keyboard-translate ?\C-h ?\C-?)

;;; C-x C-rでファイル再読み込み
(global-set-key (kbd "C-x C-r") 'revert-buffer)

;;; 自前プレフィックス
(global-unset-key (kbd "C-l"))
(global-set-key (kbd "C-l C-l") 'recenter-top-bottom)

;;; C-l r(R) で置換
(global-set-key (kbd "C-l r") 'query-replace)
(global-set-key (kbd "C-l R") 'query-replace-regexp)

;;; C-x C-cをEmacs終了ではなくクライアントの終了に割り当てる
(global-set-key (kbd "C-x C-c") 'server-edit)

;;; ミニバッファで C-w で区切りまで削除
(define-key minibuffer-local-completion-map (kbd "C-w") 'backward-kill-word)
