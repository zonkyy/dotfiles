;;;; 単語をワンキーでリージョン


;;; (package-install 'thingopt)
(use-package thingopt)
(define-thing-commands)
(global-set-key (kbd "C-@") 'mark-word*)
