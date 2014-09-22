;;;; ロードパスや .emacs を書くのに利用する関数定義・ロード


(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "~/.emacs.d/elisp/auto-install")

;;; 自前のプレフィックスキー
(global-unset-key (kbd "C-l"))

;;; dwim 用の入力関数
;;; - リージョンが指定されていないときはミニバッファから入力を求める
;;; - 指定されているときはリージョンの文字列を得る
;;; - ミニバッファの入力のデフォルト値は現在位置のシンボル(単語)
(defun region-or-prompt (prompt)
  (if (region-active-p)
      (prog1
          (buffer-substring (region-beginning) (region-end))
        (deactivate-mark)
        (message ""))
    (read-string (format "%s (default:%s): " prompt (thing-at-point 'symbol))
                 nil nil (thing-at-point 'symbol))))

;;; コマンドマルチプレクサ
;;; (package-install 'mykie)
(require 'mykie)
(setq mykie:use-major-mode-key-override t)
(mykie:initialize)
