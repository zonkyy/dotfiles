;;; カーソル位置の単語を辞書で検索して，結果をミニバッファに表示


;;; ミニバッファに表示
;;; (install-elisp-from-emacswiki "sdic-inline.el")
(setq sdic-inline-map nil)
(require 'sdic-inline)
(sdic-inline-mode t)
(setq sdic-inline-eiwa-dictionary "~/Dropbox/dict/sdic/eiji.sdic")
(setq sdic-inline-waei-dictionary "~/Dropbox/dict/sdic/waei.sdic")
(setq sdic-inline-dictionary-encoding 'utf-8-unix)
(setq sdic-inline-delay 0.14)
(setq sdic-inline-search-method 'array)
(add-to-list 'sdic-inline-enable-modes 'org-mode)


;;; ポップアップで表示
;;; (install-elisp-from-emacswiki "pos-tip.el")
;;; (install-elisp-from-emacswiki "sdic-inline-pos-tip.el")
(require 'sdic-inline-pos-tip)
(setq sdic-inline-pos-tip-timeout-auto 0)
;; ミニバッファに表示を許可しているかに関わらず辞書ポップアップ
(defun sdic-inline-popup ()
  (interactive)
  (let ((sdic-inline-display-func 'sdic-inline-pos-tip-show)
        (sdic-inline-last-word nil)
        (sdic-inline-last-point nil))
    (sdic-inline-function)))
(global-set-key (kbd "C-l d") 'sdic-inline-popup)


;;; 完全一致を検索し，見つからなければ変化形を検索する
(defun sdic-inline-search-word-exact-or-stem (word jp)
  (or (sdic-inline-search-word word jp)
      (sdic-inline-search-word-with-stem word jp)))
(setq sdic-inline-search-func 'sdic-inline-search-word-exact-or-stem)


;;; 改行を " / " に置換することでミニバッファに 1 行で表示する
(defun sdic-inline-display-oneline-in-minibuffer (entry)
  "Display meaning of word to the minibuffer."
  (let ((msg "")
        (message-truncate-lines t)
        multiline-p)
    (dolist (i entry)
      (setq msg (concat
                 msg
                 (if multiline-p "\n")
                 (sdic-inline-cut-string-1line
                  (concat (sdicf-entry-headword i)
                          "："
                          (sdicf-entry-text i)))))
      (unless multiline-p
        (setq multiline-p t)))
    (message "%s"
             (replace-regexp-in-string "\n\\s-*" " / " msg))))


;;; 色付きマークがあるときはミニバッファでなくポップアップで表示する
(defun sdic-inline-pos-tip-show-when-region-selected (entry)
  (cond
   ((and transient-mark-mode mark-active)
    (funcall 'sdic-inline-pos-tip-show entry))
   (t
    (funcall 'sdic-inline-display-oneline-in-minibuffer entry))))

(setq sdic-inline-display-func 'sdic-inline-pos-tip-show-when-region-selected)
