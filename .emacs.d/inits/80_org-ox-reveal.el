;;;; プレゼン用の出力を行う ox-reveal の設定

(use-package ox-reveal
  :ensure ox-reveal )
(setq org-reveal-width 1280)
(setq org-reveal-height 720)


(defun org-reveal-export-to-white-background-html
  (&optional async subtreep visible-only body-only ext-plist)
  "Export current buffer to a reveal.js and browse HTML file."
  (interactive)
  (load-theme 'standard t)
  (org-reveal-export-to-html async subtreep visible-only body-only ext-plist)
  (load-theme 'clarity t))


;;; メニュー追加
(org-export-define-derived-backend 'reveal 'html
  :menu-entry
  '(?R "Export to reveal.js HTML Presentation"
       ((?R "To White Background file" org-reveal-export-to-white-background-html)
        (?F "To file" org-reveal-export-to-html)
        (?B "To file and Browse" org-reveal-export-to-html-and-browse)))

  :options-alist
  '((:reveal-control nil "reveal_control" org-reveal-control t)
    (:reveal-progress nil "reveal_progress" org-reveal-progress t)
    (:reveal-history nil  "reveal_history" org-reveal-history t)
    (:reveal-center nil "reveal_center" org-reveal-center t)
    (:reveal-rolling-links nil "reveal_rolling_links" org-reveal-rolling-links t)
    (:reveal-slide-number nil "reveal_slide_number" org-reveal-slide-number t)
    (:reveal-keyboard nil "reveal_keyboard" org-reveal-keyboard t)
    (:reveal-overview nil "reveal_overview" org-reveal-overview t)
    (:reveal-width nil "reveal_width" org-reveal-width t)
    (:reveal-height nil "reveal_height" org-reveal-height)
    (:reveal-margin "REVEAL_MARGIN" nil org-reveal-margin t)
    (:reveal-min-scale "REVEAL_MIN_SCALE" nil org-reveal-min-scale t)
    (:reveal-max-scale "REVEAL_MAX_SCALE" nil org-reveal-max-scale t)
    (:reveal-root "REVEAL_ROOT" nil org-reveal-root t)
    (:reveal-trans "REVEAL_TRANS" nil org-reveal-transition t)
    (:reveal-speed "REVEAL_SPEED" nil org-reveal-transition-speed t)
    (:reveal-theme "REVEAL_THEME" nil org-reveal-theme t)
    (:reveal-extra-css "REVEAL_EXTRA_CSS" nil nil nil)
    (:reveal-extra-js "REVEAL_EXTRA_JS" nil org-reveal-extra-js nil)
    (:reveal-hlevel "REVEAL_HLEVEL" nil nil t)
    (:reveal-title-slide nil "reveal_title_slide" org-reveal-title-slide t)
    (:reveal-title-slide-template "REVEAL_TITLE_SLIDE_TEMPLATE" nil org-reveal-title-slide-template t)
    (:reveal-title-slide-background "REVEAL_TITLE_SLIDE_BACKGROUND" nil nil t)
    (:reveal-title-slide-background-size "REVEAL_TITLE_SLIDE_BACKGROUND_SIZE" nil nil t)
    (:reveal-title-slide-background-repeat "REVEAL_TITLE_SLIDE_BACKGROUND_REPEAT" nil nil t)
    (:reveal-title-slide-background-transition "REVEAL_TITLE_SLIDE_BACKGROUND_TRANSITION" nil nil t)
    (:reveal-mathjax nil "reveal_mathjax" org-reveal-mathjax t)
    (:reveal-mathjax-url "REVEAL_MATHJAX_URL" nil org-reveal-mathjax-url t)
    (:reveal-preamble "REVEAL_PREAMBLE" nil org-reveal-preamble t)
    (:reveal-head-preamble "REVEAL_HEAD_PREAMBLE" nil org-reveal-head-preamble t)
    (:reveal-postamble "REVEAL_POSTAMBLE" nil org-reveal-postamble t)
    (:reveal-multiplex-id "REVEAL_MULTIPLEX_ID" nil org-reveal-multiplex-id nil)
    (:reveal-multiplex-secret "REVEAL_MULTIPLEX_SECRET" nil org-reveal-multiplex-secret nil)
    (:reveal-multiplex-url "REVEAL_MULTIPLEX_URL" nil org-reveal-multiplex-url nil)
    (:reveal-multiplex-socketio-url "REVEAL_MULTIPLEX_SOCKETIO_URL" nil org-reveal-multiplex-socketio-url nil)
    (:reveal-slide-header "REVEAL_SLIDE_HEADER" nil org-reveal-slide-header t)
    (:reveal-slide-footer "REVEAL_SLIDE_FOOTER" nil org-reveal-slide-footer t)
    (:reveal-plugins "REVEAL_PLUGINS" nil nil t)
    (:reveal-default-frag-style "REVEAL_DEFAULT_FRAG_STYLE" nil org-reveal-default-frag-style t)
    )

  :translate-alist
  '((export-block . org-reveal-export-block)
    (headline . org-reveal-headline)
    (inner-template . org-reveal-inner-template)
    (item . org-reveal-item)
    (keyword . org-reveal-keyword)
    (plain-list . org-reveal-plain-list)
    (paragraph . org-reveal-paragraph)
    (quote-block . org-reveal-quote-block)
    (section . org-reveal-section)
    (src-block . org-reveal-src-block)
    (template . org-reveal-template))

  :filters-alist '((:filter-parse-tree . org-reveal-filter-parse-tree))
  :export-block '("REVEAL" "NOTES"))
