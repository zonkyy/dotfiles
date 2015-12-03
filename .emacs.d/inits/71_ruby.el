;;;; Ruby 用の設定


;;; Ruby モード
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append
       '(("\\.rb$" . ruby-mode)
         ("\\.rake$" . ruby-mode))
       auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))


;;; YARD モード
(use-package yard-mode
  :ensure t)


;;; インデント設定
(setq ruby-indent-level 2)
(setq ruby-indent-tabs-mode nil)
(setq ruby-deep-indent-paren-style nil)
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))


;;; end の補完
(setq ruby-end-expand-ret-key "C-j")
(setq ruby-end-insert-newline nil)
(use-package ruby-end
  :ensure ruby-end)


;;; end に対応する行のハイライト
(use-package ruby-block
  :ensure ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)


;;; Ruby 用ツール群
;;; $ gem install rcodetools
(use-package rcodetools)


;;; aline設定
(use-package align)
(add-to-list 'align-rules-list
             '(ruby-comma-delimiter
               (regexp . ",\\(\\s-*\\)[^# \t\n]")
               (repeat . t)
               (modes  . '(ruby-mode))))
(add-to-list 'align-rules-list
             '(ruby-hash-literal
               (regexp . "\\(\\s-*\\)=>\\s-*[^# \t\n]")
               (repeat . t)
               (modes  . '(ruby-mode))))


;;; hooks
(defun ruby-mode-hooks ()
  (yard-mode)
  (flycheck-mode t)
  (ggtags-mode)

  (local-set-key (kbd "C-c C-r") 'helm-myrurema)
  (local-set-key (kbd "C-c C-d") 'xmp)
  (local-set-key (kbd "C-c c") 'smart-compile)
  (local-set-key (kbd "C-c C-c") (kbd "C-c c C-m"))
  ;; '@', ':', '!' をシンボルとして扱う
  (modify-syntax-entry ?@ "_" ruby-mode-syntax-table)
  (modify-syntax-entry ?: "_" ruby-mode-syntax-table)
  (modify-syntax-entry ?! "_" ruby-mode-syntax-table))

(add-hook 'ruby-mode-hook 'ruby-mode-hooks)
