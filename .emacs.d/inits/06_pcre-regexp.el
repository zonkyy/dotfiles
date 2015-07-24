;; 一般的な正規表現で検索・置換

(use-package pcre2el
  :ensure t)

(add-hook 'prog-mode-hook 'rxt-mode)
(setq reb-re-syntax 'pcre)
(global-set-key (kbd "C-l r") 'pcre-query-replace-regexp)
