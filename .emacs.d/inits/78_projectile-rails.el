;;;; Projectile を拡張した Rails の開発支援


;;; (package-install 'projectile-rails)
(use-package projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
