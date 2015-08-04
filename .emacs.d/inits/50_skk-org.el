;;;; org-mode 時に C-j で確定したとき，インデントがずれないようにする

(require 'skk-vars)
(defadvice org-return-indent (around skk-kakutei activate)
  (cond (skk-henkan-mode
         (skk-kakutei))
        (t
         ad-do-it)))
