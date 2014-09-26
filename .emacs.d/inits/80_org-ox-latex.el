;;;; LaTeX 出力関係


(use-package ox-latex)
(use-package ox-bibtex)


;;; pbibtex (旧 jbibtex)
(setq org-latex-pdf-process
      '("platex %f"
         "platex %f"
         "pbibtex %b"
         "platex %f"
         "platex %f"
         "dvipdfmx %b.dvi"))


;;; \hypersetup{...} を出力しない
(setq org-latex-with-hyperref nil)


;; 自分用 usepackage セット
(setq org-latex-packages-alist
      '(("T1" "fontenc" t)
        ("" "fixltx2e" nil)
        ("dvipdfmx" "graphicx" t)
        ("" "longtable" nil)
        ("" "float" nil)
        ("" "wrapfig" nil)
        ("" "soul" t)
        ("" "textcomp" t)
        ("" "marvosym" t)
        ("" "wasysym" t)
        ("" "latexsym" t)
        ("" "amssymb" t)
        ("" "atbegshi" t)))
