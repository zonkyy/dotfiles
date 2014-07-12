;;;; moz (ブラウザ) のスクロール

(smartrep-define-key
    global-map "C-l C-f" '(("C-n" . 'moz-scrolldown-1)
                           ("<down>" . 'moz-scrolldown-1)
                           ("j" . 'moz-scrolldown-1)
                           ("C-v" . 'moz-scrolldown)
                           ("C-p" . 'moz-scrollup-1)
                           ("<up>" . 'moz-scrollup-1)
                           ("k" . 'moz-scrollup-1)
                           ("M-v" . 'moz-scrollup)
                           ("M-<" . 'moz-top)
                           ("M->" . 'moz-bottom)
                           ("h" . 'moz-tab-previous)
                           ("l" . 'moz-tab-next)))
