;;;; ArchLinux の PKGBUILD ファイル用の設定

;;; (package-install 'pkgbuild-mode)
(require 'pkgbuild-mode)
(setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode)) auto-mode-alist))
