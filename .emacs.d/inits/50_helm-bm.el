;;;; helm インターフェイスで bm.el を利用する

(use-package helm-bm
  :ensure helm-bm)

;;; セパレータが邪魔なので (multiline) を削除
(setq helm-source-bm
      `((name . "Visible bookmarks")
        (init . helm-bm-init)
        (volatile)
        (candidates . helm-bm-list-cache)
        (action . (("Switch to buffer" . helm-bm-action-switch-to-buffer)
                   ("Remove(s)" . helm-bm-action-remove-markd-bookmarks)
                   (,helm-bm-action-name-edit-annotation
                    . helm-bm-action-bookmark-edit-annotation)
                   ("Remove all bookmarks in current buffer" .
                    (lambda (_c) (bm-remove-all-current-buffer)))
                   ("Remove all bookmarks in all buffers" .
                    (lambda (_c) (bm-remove-all-all-buffers)))))))

(global-set-key (kbd "C-l C-;") 'helm-bm)
