;;;; Elisp インストールシステム


;;; (package-install 'auto-install)
(require 'auto-install)

(setq auto-install-directory "~/.emacs.d/elisp/auto-install")
(auto-install-update-emacswiki-package-name t)
;; install-elisp コマンドを使用
(auto-install-compatibility-setup)
