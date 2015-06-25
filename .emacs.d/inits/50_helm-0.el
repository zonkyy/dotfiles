;;;; Helm の基本設定

(use-package helm
  :ensure helm)
(use-package helm-config)
(use-package helm-migemo
  :ensure helm-migemo)
(use-package helm-mode)
(use-package helm-orgcard
  :ensure helm-orgcard)
(use-package helm-descbinds
  :ensure helm-descbinds)


;;; helm-migemo のバグ修正用設定
(eval-after-load "helm-migemo"
  '(defun helm-compile-source--candidates-in-buffer (source)
     (helm-aif (assoc 'candidates-in-buffer source)
         (append source
                 `((candidates
                    . ,(or (cdr it)
                           (lambda ()
                             ;; Do not use `source' because other plugins
                             ;; (such as helm-migemo) may change it
                             (helm-candidates-in-buffer (helm-get-current-source)))))
                   (volatile) (match identity)))
       source)))


;;; キー設定
(mykie:global-set-key "C-;"
  :default helm-for-files
  :C-u helm-occur)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(define-key helm-map (kbd "C-j") 'helm-maybe-exit-minibuffer)
(define-key helm-map (kbd "M-j") 'helm-select-3rd-action)
(define-key helm-map (kbd "C-;") 'anything-keyboard-quit)


;; ;;; 既存のコマンドを Helm インターフェイスに置き換える
(helm-mode 1)
;;; history を先に表示
(setq helm-mode-reverse-history nil)
;;; 自動補完を無効
(custom-set-variables '(helm-ff-auto-update-initial-value nil))
;;; helm-mode で無効にしたいコマンド
(add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))
(add-to-list 'helm-completing-read-handlers-alist '(find-file-at-point . nil))
(add-to-list 'helm-completing-read-handlers-alist '(write-file . nil))
(add-to-list 'helm-completing-read-handlers-alist '(helm-c-yas-complete . nil))
(add-to-list 'helm-completing-read-handlers-alist '(dired-do-copy . nil))
(add-to-list 'helm-completing-read-handlers-alist '(dired-do-rename . nil))
(add-to-list 'helm-completing-read-handlers-alist '(dired-create-directory . nil))


;;; 一度に表示する最大候補数を増やす
(setq helm-candidate-number-limit 99999)
