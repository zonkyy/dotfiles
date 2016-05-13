;;; Emacs のカレンダーインターフェイス

(use-package calfw
  :ensure calfw)
(use-package calfw-org)
(use-package calfw-ical)

;;; 長文予定の折り返し設定
(setq cfw:render-line-breaker 'cfw:render-line-breaker-simple)
;;; カレンダーに開始時刻を表示
(setq cfw:event-format-overview "%s%t")
;;; org の TODO の SCHEDULED のみを表示
(setq cfw:org-agenda-schedule-args '(:scheduled))


(defun open-my-calendar ()
  (interactive)
  (cfw:open-calendar-buffer
   :contents-sources
   (list
    (cfw:org-create-source "Gray")
    (cfw:ical-create-source "Work" "~/documents/outlook.ics" "Green"))))


;;; 縦に分割されるのを防ぐために split-width-threshold を追加
(defun cfw:show-details-command ()
  "Show details on the selected date."
  (interactive)
  (let* ((cursor-date (cfw:cursor-to-nearest-date))
         (cp  (cfw:cp-get-component))
         (model (and cp (cfw:component-model cp)))
         (split-width-threshold nil))
    (when model
      (cfw:details-popup
       (cfw:details-layout cursor-date model)))))


;;; カレンダーに DONE を表示しないために org-agenda-skip-scheduled-if-done を追加
(defun cfw:org-schedule-period-to-calendar (begin end)
  "[internal] Return calfw calendar items between BEGIN and END
from the org schedule data."
  (let ((org-agenda-skip-scheduled-if-done t))
    (loop
     with cfw:org-todo-keywords-regexp = (regexp-opt org-todo-keywords-for-agenda) ; dynamic bind
     with contents = nil with periods = nil
     for i in (cfw:org-collect-schedules-period begin end)
     for date = (cfw:org-tp i 'date)
     for line = (funcall cfw:org-schedule-summary-transformer i)
     for range = (cfw:org-get-timerange line)
     if range do
     (unless (member range periods)
       (push range periods))
     else do
     (setq contents (cfw:contents-add
                     (cfw:org-normalize-date date)
                     line contents))
     finally return (nconc contents (list (cons 'periods periods))))))


(use-package japanese-holidays
  :ensure japanese-holidays)
(setq calendar-holidays
      (append japanese-holidays local-holidays other-holidays))


(custom-set-faces
 '(cfw:face-toolbar ((t (:background "black"))))
 '(cfw:face-toolbar-button-off ((t (:foreground "Gray40" :weight bold))))
 '(cfw:face-toolbar-button-on ((t (:foreground "Gray80" :weight bold)))))


;; (global-set-key (kbd "C-l c") 'open-my-calendar)
