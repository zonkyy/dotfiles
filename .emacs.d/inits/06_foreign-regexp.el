;;;; Ruby の正規表現で検索・置換

;;; (package-install 'foreign-regexp)
(use-package foreign-regexp)
(custom-set-variables
 '(foreign-regexp/regexp-type 'ruby)
 '(reb-re-syntax 'foreign-regexp))
