;;;; Elisp インストールシステム

(use-package auto-install
  :ensure auto-install)

(setq auto-install-directory "~/.emacs.d/elisp/auto-install")
(auto-install-update-emacswiki-package-name t)
;; install-elisp コマンドを使用
(auto-install-compatibility-setup)
