;;;; Emacs 内の単語(リージョン)を Google 検索

(use-package google-this
  :ensure google-this)


(global-set-key (kbd "C-l s") 'google-this)
(google-this-mode 1)
