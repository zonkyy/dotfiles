;;;; ArchLinux の PKGBUILD ファイル用の設定

(use-package pkgbuild-mode
  :ensure pkgbuild-mode)
(setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode)) auto-mode-alist))
