;;;; 同一ファイル名バッファをフォルダ表示にする


(use-package uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")
