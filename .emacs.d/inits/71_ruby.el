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


;;; RSpec モード
;;; (package-install 'rspec-mode)
(require 'rspec-mode)


;;; (package-install 'yaml-mode)
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))


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


;;; end 等の補完
;;; (package-install 'ruby-electric)
;;; delimiter の補完は行わないように，ruby-electric をロードする前に変数を変更
(setq ruby-electric-mode-map
      (let ((map (make-sparse-keymap)))
        (define-key map " " 'ruby-electric-space/return)
        (define-key map [remap delete-backward-char] 'ruby-electric-delete-backward-char)
        (define-key map [remap newline] 'ruby-electric-space/return)
        (define-key map [remap newline-and-indent] 'ruby-electric-space/return)
        map))
(require 'ruby-electric)

;;; ruby-electric に足りない関数を追加
(defun ruby-insert-end ()
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))


;;; end に対応する行のハイライト
;;; (package-install 'ruby-block)
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)


;;; Ruby 用ツール群
;;; $ gem install rcodetools
(require 'rcodetools)
(require 'anything-rcodetools)


;;; デバッグツール
;;; (install-elisp "http://svn.ruby-lang.org/repos/ruby/trunk/misc/rubydb3x.el")
(autoload 'rubydb "rubydb3x"
  "run rubydb on program file in buffer *gud-file*.
the directory containing file becomes the initial working directory
and source-file directory for your debugger." t)


;;; aline設定
(require 'align)
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


;;; リファレンス (るりま) の helm インターフェイス
;;; (install-elisp "https://raw.github.com/nabeo/anything-myrurema/helm-myrurema/helm-myrurema.el")
(require 'helm-myrurema)


;;; メソッドの定義一覧の利用
;;; (install-elisp-from-emacswiki "back-button.el")
;;; (install-elisp "http://www.rubyist.net/~rubikitch/archive/rdefsx.el")
(require 'rdefsx)
(setq rdefsx-command (expand-file-name "~/bin/rdefsx"))
(rdefsx-auto-update-mode 1)


;;; hooks
(defun ruby-mode-hooks ()
  (flycheck-mode t)
  (ruby-electric-mode t)
  (setq ruby-electric-expand-delimiters-list nil)
  (local-set-key (kbd "C-c C-i") 'anything-rdefsx)
  (local-set-key (kbd "C-c C-r") 'helm-myrurema)
  (local-set-key (kbd "C-c C-d") 'xmp)
  (local-set-key (kbd "C-c d") 'anything-ruby-methods)
  (local-set-key (kbd "C-c c") 'smart-compile)
  (local-set-key (kbd "C-c C-c") (kbd "C-c c C-m"))
  ;; '@', ':', '!' をシンボルとして扱う
  (modify-syntax-entry ?@ "_" ruby-mode-syntax-table)
  (modify-syntax-entry ?: "_" ruby-mode-syntax-table)
  (modify-syntax-entry ?! "_" ruby-mode-syntax-table))

(add-hook 'ruby-mode-hook 'ruby-mode-hooks)
