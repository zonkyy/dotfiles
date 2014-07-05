;;;; dired で zsh の recent dirs を使用する


;;; (package-install 'helm-dired-recent-dirs)
(require 'helm-dired-recent-dirs)

;;; dired バッファ上で実行したときは先にそのバッファを消すように挙動を変更
(defun helm-dired-internal (dir)
  (interactive)
  (cond
   ((eq major-mode 'dired-mode)
    (cond
     ;; 同じバッファが他のwindowにある場合
     ((delq (selected-window) (get-buffer-window-list))
      (find-file dir))
     ;; 同じバッファが他のwindowにない場合
     (t
      (find-alternate-file dir))))
   (t
    ;; dired-mode でないとき
    (dired dir))))

(global-set-key (kbd "M-+") 'helm-dired-recent-dirs-view)
