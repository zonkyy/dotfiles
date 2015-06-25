;;;; Occur 検索結果を Helm で選択できる helm-swoop の設定

(use-package helm-swoop
  :ensure helm-swoop)


(global-set-key (kbd "C-l s") 'helm-multi-swoop-all)
(define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
(define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)


;;; isearch から移行した際にピリオドをエスケープしない
(defun helm-swoop-from-isearch ()
  "Invoke `helm-swoop' from isearch."
  (interactive)
  (isearch-exit)
  (helm-swoop :$query isearch-string))
