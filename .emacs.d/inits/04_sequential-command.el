;;;; 同じコマンドを連続実行したときの振る舞いを変更する


;;; (auto-install-batch "sequential-command")
(require 'sequential-command-config)


;;; sequential-command-config のセットアップを書き換え
(defun sequential-command-setup-keys ()
  (interactive)
  (global-set-key (kbd "M-u") 'seq-upcase-backward-word)
  (global-set-key (kbd "M-c") 'seq-capitalize-backward-word)
  (global-set-key (kbd "M-l") 'seq-downcase-backward-word))

(sequential-command-setup-keys)
