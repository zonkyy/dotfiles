;;;; SKK で使用する関数群

(defun today-string ()
  (skk-current-date
   (lambda (date-information format gengo and-time)
     (skk-default-current-date date-information nil 0 'gengo 0 0 0))))
