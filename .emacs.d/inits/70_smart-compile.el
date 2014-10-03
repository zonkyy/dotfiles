;;;; 開いているファイルの種類に適したコンパイル

(use-package smart-compile
  :ensure smart-compile)

;; smart-compile のコマンドをデフォルトから変更
(add-to-list 'smart-compile-alist '("\\.rb\\'" . "ruby %f"))
(add-to-list 'smart-compile-alist '("\\.php\\'" . "php %f "))
(add-to-list 'smart-compile-alist '("\\.c\\'" . "gcc -O2 %f -lm -o %n && ./%n"))
(add-to-list 'smart-compile-alist '("\\.[Cc]+[Pp]*\\'" . "g++ -O2 -std=c++11 %f -o %n && ./%n"))
(add-to-list 'smart-compile-alist '("\\.awk\\'" . "awk -f %f "))
