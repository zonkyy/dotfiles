;;;; C/C++ 用の設定


;;; 書式を http://www.textdrop.net/google-styleguide-ja/cppguide.xml に合わせる
(use-package google-c-style
  :ensure google-c-style)


(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))


;;; GDB のウィンドウを固定しない
(defadvice gdb-display-buffer (after undedicate-gdb-display-buffer)
  (set-window-dedicated-p ad-return-value nil))
(ad-activate 'gdb-display-buffer)

(defadvice gdb-set-window-buffer (after undedicate-gdb-set-window-buffer (name &optional ignore-dedi window))
  (set-window-dedicated-p window nil))
(ad-activate 'gdb-set-window-buffer)


;;; hooks
(defun c/c++-mode-hooks ()
  ;; google-c-style
  (google-set-c-style)
  (google-make-newline-indent)
  ;; cc-mode
  (subword-mode 1)
  ;; flycheck
  (flycheck-mode t)
  (flycheck-select-checker 'c/c++-clang)
  (setq flycheck-clang-language-standard "c++11")
  ;; GDB
  (setq gdb-many-windows t)
  ;; keybind
  (local-set-key (kbd "C-c c") 'smart-compile)
  (local-set-key (kbd "C-c C-c") (kbd "C-c c C-m"))
  (local-set-key (kbd "C-i") 'c-indent-line-or-region))

(add-hook 'c++-mode-hook 'c/c++-mode-hooks)
