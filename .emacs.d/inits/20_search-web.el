;;;; Emacs 内の単語(リージョン)をブラウザで検索


;;; (install-elisp "https://raw.github.com/tomoya/search-web.el/master/search-web.el")
(use-package search-web)

(define-prefix-command 'search-web-map)
(global-set-key (kbd "M-i") 'search-web-map)
(global-set-key (kbd "M-i g") (lambda () (interactive) (search-web-dwim "google")))
(global-set-key (kbd "M-i e") (lambda () (interactive) (search-web-dwim "eijiro")))
(global-set-key (kbd "M-i M-i") (lambda () (interactive) (search-web-dwim)))

(defun search-web-dwim (&optional arg-engine)
  "transient-mark-mode がオンの時はリージョンを，
オフの時はカーソル位置の単語を検索する．"
  (interactive)
  (cond
   ((transient-region-active-p)
    (search-web-region arg-engine))
   (t
    (search-web-at-point arg-engine))))


;;; 引数が取れるように修正
(defun search-web-at-point (engine)
  (interactive
   (list (completing-read "Search Engine: "
                          (make-search-engine-name-list) nil t)))
  (let* ((completion-ignore-case t))
  (search-web engine (substring-no-properties (thing-at-point 'word)))))

(defun search-web-region (engine)
  (interactive
   (list (completing-read "Search Engine: "
                          (make-search-engine-name-list) nil t)))
  (let* ((completion-ignore-case t)
         (beg (mark))
         (end (point)))
    (search-web engine (buffer-substring-no-properties beg end))))
