;;;; 前回の git commit からの差分をファイル編集中に視覚的に確認する


;;; (package-install 'git-gutter+)
(require 'git-gutter+)
(global-git-gutter+-mode t)


;;; シンボリックリンクを開いたときのエラーを防止
(defadvice git-gutter+-process-diff (before git-gutter+-process-diff-advice activate)
  (ad-set-arg 0 (file-truename (ad-get-arg 0))))
