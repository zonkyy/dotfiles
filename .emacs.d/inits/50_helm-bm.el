;;;; helm インターフェイスで bm.el を利用する

(use-package helm-bm
  :ensure helm-bm)

;;; migemo 使用
(push '(migemo) helm-source-bm)

;;; セパレータが邪魔なので (multiline) を削除
(setq helm-source-bm (delete '(multiline) helm-source-bm))


(defun bm-toggle-or-helm ()
  "2回連続で起動したらhelm-bmを実行させる"
  (interactive)
  (bm-toggle)
  (when (eq last-command 'bm-toggle-or-helm)
    (helm-bm)))

(global-set-key (kbd "M-SPC") 'bm-toggle-or-helm)
