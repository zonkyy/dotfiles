;;;; moz (ブラウザ) のスクロール

(smartrep-define-key
    global-map "C-l C-f" '(("C-n" . 'moz-scrolldown-10)
                           ("j" . 'moz-scrolldown-10)
                           ("<down>" . 'moz-scrolldown-10)
                           ("C-f" . 'moz-scrolldown-50)
                           ("<right>" . 'moz-scrolldown-50)
                           ("C-v" . 'moz-scrolldown-100)
                           ("C-p" . 'moz-scrollup-10)
                           ("k" . 'moz-scrollup-10)
                           ("<up>" . 'moz-scrollup-10)
                           ("C-b" . 'moz-scrollup-50)
                           ("<left>" . 'moz-scrollup-50)
                           ("M-v" . 'moz-scrollup-100)
                           ("M-<" . 'moz-top)
                           ("M->" . 'moz-bottom)
                           ("h" . 'moz-tab-previous)
                           ("l" . 'moz-tab-next)))
