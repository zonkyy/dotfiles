;;;; Helm の基本設定


;;; (package-install 'helm)
;;; (package-install 'helm-migemo)
(use-package helm)
(use-package helm-config)
(use-package helm-migemo)
(use-package helm-mode)

;;; (package-install 'helm-orgcard)
(use-package helm-orgcard)

;;; (package-install 'helm-descbinds)
(use-package helm-descbinds)


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
