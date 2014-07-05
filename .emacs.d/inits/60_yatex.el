;;;; YaTeX モードの設定


;;; ロードパス
(add-to-list 'load-path "~/.emacs.d/elisp/yatex1.77")

;;; YaTeX モードで開くファイル
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

;;; YaTeX の文字コードを UTF-8 (標準) に
(setq YaTeX-kanji-code nil)

;;; platex と dviビュアー の場所
(setq tex-command "platex")
(setq dvi2-command "xdvi")

;;; dvi -> pdf のコマンド
(setq dviprint-command-format "dvipdfmx %s")

;;; yatexのプレフィックス設定
(setq YaTeX-inhibit-prefix-letter nil)
