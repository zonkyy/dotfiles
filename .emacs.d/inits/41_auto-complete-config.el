;;;; ac-source の設定
;;;; (auto-complete-config.el の Default settings を全てコピペして改変)


;;; global-auto-complete-mode で有効にするメジャーモード
(setq ac-modes
  '(emacs-lisp-mode lisp-mode lisp-interaction-mode
    slime-repl-mode
    c-mode cc-mode c++-mode go-mode
    java-mode malabar-mode clojure-mode clojurescript-mode  scala-mode
    scheme-mode
    ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode
    perl-mode cperl-mode python-mode ruby-mode lua-mode
    ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode
    makefile-mode sh-mode fortran-mode f90-mode ada-mode
    xml-mode sgml-mode
    ts-mode
    sclang-mode
    verilog-mode
    org-mode))


;;; yasnippet用，パス入力用の情報源を追加
(defun ac-common-setup ()
  (add-to-list 'ac-sources 'ac-source-yasnippet)
  (add-to-list 'ac-sources 'ac-source-filename))

;;; ac-source-filename は ac-sources の先頭でないと "~/" が上手く補完できないため，
;;; ac-sources の後ろに mode-hook 用情報源を付け足すよう変更
(defun ac-emacs-lisp-mode-setup ()
  (setq ac-sources (append ac-sources '(ac-source-features ac-source-functions ac-source-variables ac-source-symbols))))

(defun ac-cc-mode-setup ()
  (setq ac-sources (append ac-sources '(ac-source-gtags))))

(defun ac-ruby-mode-setup ())

(defun ac-css-mode-setup ()
  (setq ac-sources (append ac-sources '(ac-source-css-property))))

(defun ac-org-mode-setup ())


(defun ac-config-default ()
  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'org-mode-hook 'ac-org-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))


;;; 設定した ac-source を適用する
(ac-config-default)
