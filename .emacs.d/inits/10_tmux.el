;;;; tmux との連携設定


;;; (package-install 'emamux)
;;; (install-elisp "http://www.rubyist.net/~rubikitch/archive/tmux-doit.el")
(use-package emamux)
(load "tmux-doit.el")


;;; tmux のペーストバッファを Emacs に貼り付け
(defun tmux-paste ()
  (interactive)
  (let ((tmpfile (make-temp-file "tmux-paste-")))
    (emamux:tmux-run-command (concat "save-buffer " tmpfile))
    (insert-file tmpfile)
    (delete-file tmpfile))
  (exchange-point-and-mark))

(defun select-rxvt ()
  (interactive)
  (call-process "select-window" nil nil nil "byobu"))


;;; C-] RET を追加するため，tmux-doit.el の関数を上書き
(defun tmux-doit ()
  (interactive)
  (let ((ch (read-event)))
    (case ch
      ;; C-] C-]でペーストバッファ貼り付け
      (?\C-\] (tmux-paste))
      ;; C-] C-jで端末に切り替える
      (?\C-j  (select-rxvt))
      ;; C-] C-j でキルリングを tmux のペーストバッファに
      ('return (emamux:copy-kill-ring nil)
               (emamux:tmux-run-command
                (tmux-key-to-command (tmux-char-to-keyname ?\])))
               (select-rxvt))
      ;; それ以外は端末に切り替えた後、同じキー操作を行う
      (t (emamux:tmux-run-command
          (tmux-key-to-command (tmux-char-to-keyname ch)))
         (select-rxvt)))))

(global-set-key (kbd "C-]") 'tmux-doit)
(global-set-key (kbd "C-x C-]") 'abort-recursive-edit)
