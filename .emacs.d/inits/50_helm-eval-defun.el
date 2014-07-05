;;;; Helm の情報源を C-M-x で実行


(defvar helm-enable-eval-defun-hack t)

(defadvice eval-defun (after helm-source-hack activate)
  (when helm-enable-eval-defun-hack
    (let ((varsym (save-excursion
                    (beginning-of-defun)
                    (forward-char 1)
                    (when (memq (read (current-buffer)) '(defvar setq))
                      (read (current-buffer))))))
      (when (string-match "^helm-source-" (symbol-name varsym))
        (helm varsym)))))
