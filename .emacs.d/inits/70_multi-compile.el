;;;; 開いているファイルの種類に適したコンパイル

(use-package multi-compile
  :ensure t)

(setq multi-compile-alist
      '((ruby-mode . (("exec" . "ruby %file-name")))
        (php-mode . (("exec" . "php %file-name")))
        (c++-mode . (("exec" . "clang++ -O2 -std=c++11 %file-name -lm -o %file-sans && ./%file-sans")
                     ("debug" . "clang++ -g3 -O0 -std=c++11 %file-name -lm -o %file-sans")
                     ("compile" . "clang++ -O2 -std=c++11 %file-name -lm -o %file-sans")))))


;;; multi-compile で引数を自由に入力できるような仕組みを導入。
;;; 前置引数となる C-u の回数でミニバッファに初期入力される内容を切り替える。
(defun multi-compile--input-command (compile-list &optional prefix)
  (if (= 1 (length compile-list))
      (read-string "Compile command: " (multi-compile--fill-template (cdar compile-list)))
    (let ((offset (count-c-u prefix)))
      (if (<= (length compile-list) offset)
          (read-string "Compile command: " (multi-compile--fill-template (cdar compile-list)))
        (read-string "Compile command: " (multi-compile--fill-template (cdr (nth offset compile-list))))))))

(defun multi-compile--get-input-command (&optional prefix)
  (let ((filename (if (stringp buffer-file-name) buffer-file-name (buffer-name))))
    (if (not filename)
        (read-string "Compile command: ")
      (let ((command-list (multi-compile--fill-command-list filename)))
        (if command-list
            (multi-compile--input-command command-list prefix)
          (read-string "Compile command: "))))))

(defun multi-compile-input-and-run (prefix)
  (interactive "p")
  (let* ((template (multi-compile--get-input-command prefix))
         (command (or (car-safe template) template))
         (default-directory (if (listp template) (eval-expression (cadr template)) default-directory)))
    (compilation-start
     (multi-compile--fill-template command))))
