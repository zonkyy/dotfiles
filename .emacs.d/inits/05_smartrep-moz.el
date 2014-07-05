;;;; moz (ブラウザ) のスクロール

(smartrep-define-key
    global-map "C-l C-f" '(("C-n" . 'moz-scrolldown-1)
                           ("C-v" . 'moz-scrolldown)
                           ("C-p" . 'moz-scrollup-1)
                           ("M-v" . 'moz-scrollup)
                           ("M-<" . 'moz-top)
                           ("M->" . 'moz-bottom)))
