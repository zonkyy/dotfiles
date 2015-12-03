;;;; paredit 設定と、DDSKK との競合回避


;;; 括弧の対応を保持して編集する
(use-package paredit
  :ensure paredit)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook 'enable-paredit-mode)


;;; 一部のキーを skk-j-mode が on のときに skk-insert にすり替える
(defun skk-my-paredit-func-or-skk-insert (orig-func &rest args)
  (apply (cond (skk-j-mode
                'skk-insert)
               (t
                orig-func))
         args))

(advice-add 'paredit-semicolon :around 'skk-my-paredit-func-or-skk-insert)
(advice-add 'paredit-open-square :around 'skk-my-paredit-func-or-skk-insert)
(advice-add 'paredit-close-square :around 'skk-my-paredit-func-or-skk-insert)
