;;;; キー操作を繰り返す

;;; (install-elisp "http://www.pitecan.com/DynamicMacro/dmacro.el")
(defun dmacro-exec ()
  (interactive)
  (let ((*dmacro-key* (this-single-command-keys)))
    (use-package dmacro)
    ;; dmacro-exec is overriden here
    (call-interactively 'dmacro-exec)))

(global-set-key (kbd "<f4>") 'dmacro-exec)
