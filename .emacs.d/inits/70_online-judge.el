;;; オンラインジャッジ用の設定

;;; oj.py で codeforces のチェックを行う
(defvar online-judge-helper-path "oj.py")
(defvar online-judge-target "codeforces")
(defun online-judge-check ()
  (interactive)
  (let* ((split-path (f-split (f-no-ext (f-this-file))))
         (contest-id (nth 1 (reverse split-path)))
         (problem-id (nth 0 (reverse split-path)))
         (temp-buffer-name (format "*Judge: %s%s*" contest-id problem-id)))
    (with-output-to-temp-buffer temp-buffer-name
      (princ (shell-command-to-string (format "%s --%s %s %s"
                                              online-judge-helper-path
                                              online-judge-target
                                              contest-id
                                              problem-id))))))
