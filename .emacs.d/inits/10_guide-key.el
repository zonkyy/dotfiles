;;; 入力したプレフィックスが持つコマンドを列挙する


(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-l"))
(setq guide-key/idle-delay 0.3)
(guide-key-mode 1)
