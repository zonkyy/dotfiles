;;;; プロジェクト管理をする projectile-mode

(use-package projectile
  :ensure t)
(projectile-global-mode)

(use-package helm-projectile
  :ensure t)
(helm-projectile-on)
