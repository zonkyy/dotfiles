;;;; Ruby の正規表現で検索・置換

(use-package foreign-regexp
  :ensure foreign-regexp)
(custom-set-variables
 '(foreign-regexp/regexp-type 'ruby)
 '(reb-re-syntax 'foreign-regexp))
