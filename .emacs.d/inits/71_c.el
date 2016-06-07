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


;;; GDB 実行時にキーでデバッグを行う設定
(defun gdb-quit-view-mode ()
  (interactive)
  (view-mode 0)
  (delete-other-windows))

(defvar gdb-view-keybinds
  `((" " . gud-next)
    ("i" . gud-step)
    ("b" . gud-break)
    ("u" . gud-remove)
    ("g" . gud-cont)
    ("h" . gud-until)
    ("p" . gud-print-prompt)
    ("r" . gud-run)
    ("R" . gud-run-from-stdin)))

(defun gdb-add-view-mode-to-source-file (source-file-name)
  (with-current-buffer (get-file-buffer source-file-name)
    (view-mode)
    (define-many-keys view-mode-map gdb-view-keybinds)
    (define-key view-mode-map (kbd "q") 'gdb-quit-view-mode)))

(defun gdb-mode-hooks ()
  (gud-def gud-print-prompt
           (gud-call (format "print %s" (region-or-prompt "print")))
           nil)
  (gud-def gud-run-from-stdin
           (gud-call (format "run < %s" (read-file-name "run < ")))
           nil)
  ;; XXX: gdb-main-file が更新されるのを無理矢理待つ
  (sit-for 0.1)
  (gdb-add-view-mode-to-source-file gdb-main-file)
  (next-window-except-ignore-window))

(add-hook 'gdb-mode-hook 'gdb-mode-hooks)


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
  (local-set-key (kbd "C-c c") 'multi-compile-input-and-run)
  (local-set-key (kbd "C-c C-c") 'multi-compile-run)
  (local-set-key (kbd "C-i") 'c-indent-line-or-region))

(add-hook 'c++-mode-hook 'c/c++-mode-hooks)
