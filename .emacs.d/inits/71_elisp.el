;;; Emacs-Lisp 用の設定


;;; C-c C-d で式の評価結果を注釈する
(use-package lispxmp
  :ensure lispxmp)
(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)


;;; 括弧の対応を保持して編集する
(use-package paredit
  :ensure paredit)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook 'enable-paredit-mode)


;;; M-: でミス入力しても再入力する必要をなくす
;; (install-elisp "http://www.splode.com/~friedman/software/emacs-lisp/src/eval-expr.el")
(use-package eval-expr)
(eval-expr-install)


;;; デバッグを容易にする d マクロ
;;; (値を表示したい式を (d 式) に置き換える)
(defmacro d (expr)
  `(let ((_var (eval ',expr)))
     (run-at-time 0 nil 'display-buffer "*Messages*")
     (message "%S=%S" ',expr _var)
     _var))


;;; 対応する括弧に同じ色を付ける
(use-package rainbow-delimiters
  :ensure rainbow-delimiters)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(set-face-background 'rainbow-delimiters-unmatched-face "red")
(set-face-foreground 'rainbow-delimiters-depth-1-face "#E52020")
(set-face-foreground 'rainbow-delimiters-depth-2-face "#68A8FF")
(set-face-foreground 'rainbow-delimiters-depth-3-face "#FA2473")
(set-face-foreground 'rainbow-delimiters-depth-4-face "#A6E12B")
(set-face-foreground 'rainbow-delimiters-depth-5-face "#FB951D")
(set-face-foreground 'rainbow-delimiters-depth-6-face "#FF3040")
(set-face-foreground 'rainbow-delimiters-depth-7-face "#0040FF")
(set-face-foreground 'rainbow-delimiters-depth-8-face "#A000FF")
(set-face-foreground 'rainbow-delimiters-depth-9-face "#00FF80")
