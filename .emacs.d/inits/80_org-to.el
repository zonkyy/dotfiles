;;;; org ファイルを別形式に変換する関数等の設定


;;; org ファイルをはてなブログにアップロード
(defun org-to-hatena ()
  (interactive)
  (shell-command (format "orgtohatena.rb %s" (buffer-file-name)))
  (shell-command (format "hw.pl -M -c -u akisute3 -f %s" (concat (file-name-sans-extension (buffer-file-name)) ".txt"))))


;;; はてなブログにアップロードした org ファイルをちょっとだけ更新
(defun org-to-hatena-update ()
  (interactive)
  (shell-command (format "orgtohatena.rb %s" (buffer-file-name)))
  (shell-command (format "hw.pl -t -M -c -u akisute3 -f %s" (concat (file-name-sans-extension (buffer-file-name)) ".txt"))))


;;; Qiita の Markdown 記法に変換
(defun org-to-qiita ()
  (interactive)
  (let ((file (file-name-sans-extension (buffer-file-name))))
    (shell-command (format "ruby ~/program/ruby/org_parser/org2qiita.rb %s" (concat file ".org")))
    (find-file (concat file ".txt"))))
