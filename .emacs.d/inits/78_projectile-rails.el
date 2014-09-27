;;;; Projectile を拡張した Rails の開発支援

(use-package projectile-rails
  :ensure projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
