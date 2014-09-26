;;; org 文書をはてな記法に変換する

(add-to-list 'load-path "~/.emacs.d/elisp/work/ox-hatena")

(use-package ox-hatena)
(setq org-hatena-output-mode 'blog)


;;; 出力後に text-adjust 実行 (to-hatena 以外)
(defadvice org-hatena-export-as-hatena (after text-adjust activate)
  (text-adjust-buffer))

(defadvice org-hatena-export-to-hatena-and-open (after text-adjust activate)
  (text-adjust-buffer))
