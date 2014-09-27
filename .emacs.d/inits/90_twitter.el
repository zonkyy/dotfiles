;;;; Emacs で Twitter

(use-package twittering-mode
  :ensure twittering-mode)
(setq twittering-use-master-password t)
(setq twittering-allow-insecure-server-cert t)
(setq twittering-icon-mode t)
(setq twittering-convert-fix-size 18)
(setq twittering-status-format
      "%i%R %p%s %C{%-m/%-d(%a)%1H:%1M} %r\n  %t\n")
(setq twittering-initial-timeline-spec-string
      '(":home" "akisute3" ":mentions"))
(global-set-key (kbd "C-l t") 'twit)


;;; 新しい TL を開く前に現在の TL バッファを削除する
(defadvice twittering-visit-timeline (before kill-buffer-before-visit-timeline activate)
  "Kill TL buffer before visit new TL."
  (twittering-kill-buffer))


;;; twittering-initial-timeline-spec-string の次/前の TL を開く
(defun twittering-kill-and-switch-to-next-timeline ()
  (interactive)
  (when (twittering-buffer-p)
    (let* ((buffer-list twittering-initial-timeline-spec-string)
           (following-buffers (cdr (member (buffer-name (current-buffer)) buffer-list)))
           (next (if following-buffers
                     (car following-buffers)
                   (car buffer-list))))
      (unless (eq (current-buffer) next)
        (twittering-visit-timeline next)))))

(defun twittering-kill-and-switch-to-previous-timeline ()
  (interactive)
  (when (twittering-buffer-p)
    (let* ((buffer-list (reverse twittering-initial-timeline-spec-string))
           (preceding-buffers (cdr (member (buffer-name (current-buffer)) buffer-list)))
           (previous (if preceding-buffers
                         (car preceding-buffers)
                       (car buffer-list))))
      (unless (eq (current-buffer) previous)
        (twittering-visit-timeline previous)))))


(defun twittering-mode-hooks ()
  ;; 色
  (set-face-bold-p 'twittering-username-face t)
  (set-face-foreground 'twittering-username-face "orange2")
  (set-face-foreground 'twittering-uri-face "cyan3")
  (setq truncate-partial-width-windows nil)

  ;; キー
  (define-key twittering-mode-map (kbd "R") 'twittering-native-retweet)
  (define-key twittering-mode-map (kbd "f") 'twittering-kill-and-switch-to-next-timeline)
  (define-key twittering-mode-map (kbd "b") 'twittering-kill-and-switch-to-previous-timeline)

  ;; カーソルに色をつける
  (hl-line-mode))

(add-hook 'twittering-mode-hook 'twittering-mode-hooks)
