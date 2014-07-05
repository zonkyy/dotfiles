;;;; Emacs で Git を使用する


;;; (package-install 'magit)
(require 'magit)
(global-set-key (kbd "C-x v d") 'magit-status)
(global-set-key (kbd "C-x v L") 'magit-key-mode-popup-logging)
(global-set-key (kbd "C-x v z") 'magit-stash)
(define-key magit-mode-map "\M-l" "l-all")


;;; magit の diff で左側に新しいファイルを
(defadvice magit-ediff* (before swap-a-b activate)
  (let ((tmp-a (ad-get-arg 0)))
    (ad-set-arg 0 (ad-get-arg 1))
    (ad-set-arg 1 tmp-a)))
