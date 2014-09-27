;;;; YASnippet の設定

(use-package yasnippet
  :ensure yasnippet)

(yas-global-mode 1)
(setq yas-prompt-functions '(yas-no-prompt))
(define-key yas-minor-mode-map (kbd "C-i") nil)


;;; フィールドの編集で smartchr が効かなくなる問題の修正
(remove-hook 'c-mode-common-hook
             '(lambda ()
                (dolist (k '(":" ">" ";" "<" "{" "}"))
                  (define-key (symbol-value (make-local-variable 'yas-keymap))
                    k 'self-insert-command))))

;;; キーが重複したときに yas-snippet-dirs のリストで先頭に近い
;;; ディレクトリのスニペットが挿入されるように修正
(defun yas--prompt-for-template (templates &optional prompt)
  (when templates
    (some #'(lambda (fn)
              (funcall fn (or prompt "Choose a snippet: ")
                       templates
                       #'yas--template-name))
          yas-prompt-functions)))
