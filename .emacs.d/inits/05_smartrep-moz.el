;;;; moz (ブラウザ) のスクロール

(smartrep-define-key
    global-map "C-l C-f" '(("C-n" . 'moz-scrolldown-line)
                           ("j" . 'moz-scrolldown-line)
                           ("<down>" . 'moz-scrolldown-line)
                           ("C-f" . 'moz-scrolldown-halfpage)
                           ("<right>" . 'moz-scrolldown-halfpage)
                           ("C-v" . 'moz-scrolldown-page)
                           ("C-p" . 'moz-scrollup-line)
                           ("k" . 'moz-scrollup-line)
                           ("<up>" . 'moz-scrollup-line)
                           ("C-b" . 'moz-scrollup-halfpage)
                           ("<left>" . 'moz-scrollup-halfpage)
                           ("M-v" . 'moz-scrollup-page)
                           ("M-<" . 'moz-top)
                           ("M->" . 'moz-bottom)
                           ("h" . 'moz-tab-previous)
                           ("l" . 'moz-tab-next)))
