;;;; プロジェクト管理をする projectile-mode


;;; (package-install 'projectile)
(require 'projectile)
(projectile-global-mode)

;;; ファイル選択に helm を使用する
(setq projectile-completion-system 'helm)