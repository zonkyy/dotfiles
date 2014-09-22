;;;; 使い捨てコード用のファイルを開く


;;; (package-install 'open-junk-file)
(require 'open-junk-file)

;; 別ウィンドウではなく現在のウィンドウに開く
(setq open-junk-file-find-file-function 'find-file)
;; ファイルのフォーマット
(defvar junk-file-dir "~/program/junk/")
(defvar junk-file-format "%Y/%m/%Y-%m-%d-%H%M%S.")
(setq open-junk-file-format
      (concat
       (expand-file-name junk-file-dir)
       junk-file-format))


;;; 現在のウィンドウで開く
(defun open-junk-file-current-window ()
  (interactive)
  (let ((open-junk-file-find-file-function 'find-file))
    (open-junk-file)))


;;; 一番新しい junk コードを開く
(require 'em-glob)
(defun open-last-junk-file ()
  (interactive)
  (find-file (car
              (last (eshell-extended-glob (concat
                                           (file-name-as-directory junk-file-dir)
                                           "*/*/????-??-??-??????.*"))))))


;;; junk ファイルを anything で一覧化
(defun junk-file-list ()
  (reverse (eshell-extended-glob (concat
                                  (file-name-as-directory junk-file-dir)
                                  "*/*/????-??-??-??????.*"))))

(defvar helm-source-junk-files
  '((name . "Junk Files")
    (candidates . junk-file-list)
    (type . file)))

(defun helm-open-junk-file ()
  (interactive)
  (helm-other-buffer 'helm-source-junk-files "*helm for junk file*"))


;;; キー割り当て
(mykie:global-set-key "C-x j"
  :default open-junk-file
  :C-u     open-junk-file-current-window)
(global-set-key (kbd "C-x J") 'open-last-junk-file)
(global-set-key (kbd "C-x M-j") 'helm-open-junk-file)
