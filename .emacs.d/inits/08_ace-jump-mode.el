;;;; 移動したい場所にカーソルを直接移動する


;;; (package-install 'ace-jump-mode)
(require 'ace-jump-mode)
(define-key global-map (kbd "M-SPC") 'ace-jump-mode)
