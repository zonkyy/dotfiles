;;;; org-mode 時に C-j で確定したとき，インデントがずれないようにする

(defadvice org-return-indent (around skk-kakutei activate)
  (cond (skk-henkan-mode
         (skk-kakutei))
        (t
         ad-do-it)))
