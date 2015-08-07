;;;; 標準コマンドのキー割り当て


;;; サスペンドしない
(global-unset-key (kbd "C-x C-z"))

;;; C-h にバックスペース
(keyboard-translate ?\C-h ?\C-?)

;;; C-x C-rでファイル再読み込み
(global-set-key (kbd "C-x C-r") 'revert-buffer)

;;; C-l をプレフィックスキーとしたため元のコマンドを C-l C-l に変更
(global-set-key (kbd "C-l C-l") 'recenter-top-bottom)

;;; 置換のコマンドを C-l プレフィックスキーを使ったキーに変更
(global-set-key (kbd "C-l R") 'query-replace-regexp)
(global-set-key (kbd "C-l C-r") 'query-replace)

;;; C-x C-cをEmacs終了ではなくクライアントの終了に割り当てる
(global-set-key (kbd "C-x C-c") 'server-edit)

;;; ミニバッファで C-w で区切りまで削除
(define-key minibuffer-local-completion-map (kbd "C-w") 'backward-kill-word)

;;; CUA モードの矩形選択
(global-set-key (kbd "C-x SPC") 'cua-rectangle-mark-mode)

;;; C-l SPC でスペースの数を 1, 0, n の 3 通りに切り替え
(global-set-key (kbd "C-l SPC") 'cycle-spacing)
