;;; org-mode プロジェクト


(setq org-publish-project-alist
      '(("All"
         :components ("org-documents" "org-junks" "org-static"))

        ("org-documents"
         :base-directory "~/Dropbox/documents/org/"
         :base-extension "org"
         :publishing-directory "~/Dropbox/html/org/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :html-head "<link rel=\"stylesheet\"
                    href=\"../css/org-html-style.css\"
                    type=\"text/css\"/>"
         :auto-sitemap t)

        ("org-static"
         :base-directory "~/Dropbox/documents/org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/Dropbox/html/org/"
         :recursive t
         :publishing-function org-publish-attachment)

        ("org-junks"
         :base-directory "~/Dropbox/program/junk/"
         :base-extension "org"
         :publishing-directory "~/Dropbox/html/org/junk/"
         :recursive t
         :publishing-function org-html-publish-to-html)))


;;; 終了時に recentf を無効にして publish するコマンド
(defun exit-and-publish ()
  (interactive)
  (org-publish-all-documents)
  (exit))

(defun org-publish-all-documents ()
  (recentf-mode -1)
  (org-publish-project "All"))
