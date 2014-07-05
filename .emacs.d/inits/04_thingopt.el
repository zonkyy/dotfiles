;;;; 単語をワンキーでリージョン


;;; (package-install 'thingopt)
(require 'thingopt)
(define-thing-commands)
(global-set-key (kbd "C-@") 'mark-word*)
