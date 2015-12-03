;;;; SKK モードの基本設定。

(use-package skk
  :ensure ddskk
  :init
  (setq skk-user-directory "~/.emacs.d/ddskk/"))

(defun skk-remove-kakutei-keymap ()
  (define-key skk-j-mode-map (kbd "C-j") nil)
  (define-key skk-latin-mode-map (kbd "C-j") nil)
  (define-key skk-jisx0208-latin-mode-map (kbd "C-j") nil)
  (define-key skk-abbrev-mode-map (kbd "C-j") nil))
(advice-add 'skk-setup-keymap :after 'skk-remove-kakutei-keymap)
