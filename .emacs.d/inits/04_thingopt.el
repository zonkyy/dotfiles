;;;; 単語をワンキーでリージョン

(use-package thingopt
  :ensure thingopt)
(define-thing-commands)
(global-set-key (kbd "C-@") 'mark-word*)
