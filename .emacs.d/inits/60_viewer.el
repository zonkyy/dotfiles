;;;; 文字を入力しないモードの設定


(use-package viewer
  :ensure t
  :config
  (viewer-stay-in-setup)
  (setq viewer-modeline-color-view "tomato")
  (setq viewer-modeline-color-default "darkslateblue")
  (viewer-change-modeline-color-setup))


;;; キー定義を行う関数
(defun define-many-keys (keymap key-table &optional includes)
  (let (key cmd)
    (dolist (key-cmd key-table)
      (setq key (car key-cmd)
            cmd (cdr key-cmd))
      (if (or (not includes) (member key includes))
        (define-key keymap key cmd))))
  keymap)
