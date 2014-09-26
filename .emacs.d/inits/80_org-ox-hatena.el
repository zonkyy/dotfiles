;;; org 文書をはてな記法に変換する

(use-package ox-hatena :load-path "elisp/work/ox-hatena")
(setq org-hatena-output-mode 'blog)


;;; 出力後に text-adjust 実行 (to-hatena 以外)
(defadvice org-hatena-export-as-hatena (after text-adjust activate)
  (text-adjust-buffer))

(defadvice org-hatena-export-to-hatena-and-open (after text-adjust activate)
  (text-adjust-buffer))
