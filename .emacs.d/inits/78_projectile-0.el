;;;; プロジェクト管理をする projectile-mode

(use-package projectile
  :ensure projectile)
(projectile-global-mode)

;;; ファイル選択に helm を使用する
(setq projectile-completion-system 'helm)
