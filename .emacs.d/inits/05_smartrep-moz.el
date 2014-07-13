;;;; moz (ブラウザ) のスクロール

(smartrep-define-key
    global-map "C-l C-f" '(("C-n" . 'moz-scrolldown-1)
                           ("j" . 'moz-scrolldown-1)
                           ("<down>" . 'moz-scrolldown-1)
                           ("C-f" . 'moz-scrolldown-10)
                           ("<right>" . 'moz-scrolldown-10)
                           ("C-v" . 'moz-scrolldown)
                           ("C-p" . 'moz-scrollup-1)
                           ("k" . 'moz-scrollup-1)
                           ("<up>" . 'moz-scrollup-1)
                           ("C-b" . 'moz-scrollup-10)
                           ("<left>" . 'moz-scrollup-10)
                           ("M-v" . 'moz-scrollup)
                           ("M-<" . 'moz-top)
                           ("M->" . 'moz-bottom)
                           ("h" . 'moz-tab-previous)
                           ("l" . 'moz-tab-next)))
