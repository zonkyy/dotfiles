;;; ox-pukiwiki.el --- PukiWiki Notation Back-End for Org Export Engine

;; Copyright (C) 2014  akisute3 <akisute3@gmail.com>

;; Author: akisute3 <akisute3@gmail.com>
;; Version: 0.1
;; Package-Requires: ((org "8.0"))
;; Keywords: org export pukiwiki

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Installation:

;; (require 'ox-pukiwiki)

;;; Code:


;;; Dependencies

(require 'ox)


;;; Define Back-End

(org-export-define-backend 'pukiwiki
  '((section . org-pukiwiki-section)
    (headline . org-pukiwiki-headline)
    (paragraph . org-pukiwiki-paragraph)
    (plain-list . org-pukiwiki-plain-list)
    (item . org-pukiwiki-item)
    (quote-block . org-pukiwiki-quote-block)
    (example-block . org-pukiwiki-example-block)
    (fixed-width . org-pukiwiki-fixed-width)
    (inline-src-block . org-pukiwiki-inline-src-block)
    (src-block . org-pukiwiki-src-block)
    (footnote-reference . org-pukiwiki-footnote-reference)
    (link . org-pukiwiki-link)
    (table . org-pukiwiki-table)
    (table-cell . org-pukiwiki-table-cell)
    (table-row . org-pukiwiki-table-row)
    (template . org-pukiwiki-template)
    )
  :menu-entry
  '(?w "Export to PukiWiki Notation"
       ((?W "As PukiWiki Notation buffer" org-pukiwiki-export-as-pukiwiki)
        (?w "As PukiWiki Notation file" org-pukiwiki-export-to-pukiwiki)
        (?o "As PukiWiki Notation file and open" org-pukiwiki-export-to-pukiwiki-and-open))))


;;; Internal Variables

(defvar org-pukiwiki-extension "txt")

(defvar org-pukiwiki-output-mode 'buffer)


;;; Functions for Back-End

(defun org-pukiwiki-section (section contents info)
  contents)

(defun org-pukiwiki-headline (headline contents info)
  (let* ((raw-level (org-export-get-relative-level headline info))
         (level raw-level)
         (section-fmt (concat (make-string level ?*) " %s\n%s"))
         (text (org-export-data (org-element-property :title headline) info))
         (pre-blanks (make-string (org-element-property :pre-blank headline) ?\n)))
    (cond ((equal level 1)
           (format section-fmt "PHP マニュアル読み" (concat pre-blanks contents)))
          ((equal level 4)
           contents)
          (t
           (format section-fmt text (concat pre-blanks contents))))))

(defun org-pukiwiki-paragraph (paragraph contents info)
  contents)

(defun org-pukiwiki-plain-list (list contents info)
  contents)

(defun org-pukiwiki-item (item contents info)
  (let* ((type (org-element-property :type (org-export-get-parent item)))
         (struct (org-element-property :structure item))
         (tag (let ((tag (org-element-property :tag item)))
                (and tag (org-export-data tag info))))
         (bullet
          (cond ((eq type 'unordered) "-")
                ((eq type 'ordered) "+")
                ((eq type 'descriptive) (concat ": " tag " | "))))
         text)
    (replace-regexp-in-string "^\\([^-+:]\\)" (concat bullet "\\1")
                              (replace-regexp-in-string "^\\([-+:]\\)" "\\1\\1" contents))))

(defun org-pukiwiki-quote-block (quote-block contents info)
  (format ">>\n%s<<" contents))

(defun org-pukiwiki-example-block (example-block contents info)
  (when (org-string-nw-p (org-element-property :value example-block))
    (format ">||\n%s||<"
            (org-remove-indentation
             (org-export-format-code-default example-block info)))))

(defun org-pukiwiki-fixed-width (fixed-width contents info)
  (format ">||\n%s||<"
          (org-remove-indentation
           (org-element-property :value fixed-width))))

(defun org-pukiwiki-src-block (src-block contents info)
  (when (org-string-nw-p (org-element-property :value src-block))
    (format ">|%s|\n%s||<"
            (org-element-property :language src-block)
            (org-export-format-code-default src-block info))))

(defun org-pukiwiki-footnote-reference (footnote-reference contents info)
  (let ((def (org-export-get-footnote-definition footnote-reference info)))
    (format "((%s))"
            (org-trim (org-export-data def info)))))

(defun org-pukiwiki-link (link desc info)
  (let* ((type (org-element-property :type link))
         (raw-path (org-element-property :path link))
         (path (cond
                ((member type '("http" "https" "ftp" "mailto"))
                 (concat type ":" raw-path))
                (t raw-path)))
         (option (and desc (= (aref desc 0) ?:) desc)))
    (cond (option
           (format "[%s%s]" path option))
          (desc
           (format "[%s:title=%s]" path desc))
          (t
           path))))

(defun org-pukiwiki-table (table contents info)
  contents)

(defun org-pukiwiki-table-row (table-row contents info)
  (when (eq (org-element-property :type table-row) 'standard)
    (concat
     (if (org-export-table-row-starts-header-p table-row info)
         (replace-regexp-in-string "|" "|*" contents)
       contents)
     "|\n")))

(defun org-pukiwiki-table-cell (table-cell contents info)
  (concat "|" contents))

(defun org-pukiwiki-template (contents info)
  (cond ((equal org-pukiwiki-output-mode 'buffer)
         (concat "#contents()\n#setlinebreak()\n" contents))
        ((equal org-pukiwiki-output-mode 'region)
         (format "*** %s\n%s" (format-time-string "%Y-%m-%d %A") contents))))


;;; End-user functions

(defun org-pukiwiki-export-as-pukiwiki (&optional async subtreep visible-only body-only ext-plist)
  (interactive)
  (let ((org-pukiwiki-output-mode (if (transient-region-active-p)
                                      'region
                                    'buffer)))
    (if async
        (org-export-async-start
            (lambda (output)
              (with-current-buffer (get-buffer-create "*Org PUKIWIKI Export*")
                (erase-buffer)
                (insert output)
                (goto-char (point-min))
                (set-auto-mode t)
                (org-export-add-to-stack (current-buffer) 'pukiwiki)))
          `(org-export-as 'pukiwiki ,subtreep ,visible-only ,body-only ',ext-plist))
      (let ((outbuf (org-export-to-buffer
                        'pukiwiki "*Org PUKIWIKI Export*" subtreep visible-only body-only ext-plist)))
        (with-current-buffer outbuf (set-auto-mode t))
        (when org-export-show-temporary-export-buffer
          (switch-to-buffer-other-window outbuf))))))

(defun org-pukiwiki-export-to-pukiwiki (&optional async subtreep visible-only body-only ext-plist)
  (interactive)
  (let* ((extension (concat "." org-pukiwiki-extension))
         (outfile (org-export-output-file-name extension subtreep)))
    (if async
        (org-export-async-start
            (lambda (f) (org-export-add-to-stack f 'pukiwiki))
          `(expand-file-name
            (org-export-to-file
             'pukiwiki ,outfile ,subtreep ,visible-only ,body-only ',ext-plist)))
      (org-export-to-file
       'pukiwiki outfile subtreep visible-only body-only ext-plist))))

(defun org-pukiwiki-export-to-pukiwiki-and-open (async subtreep visible-only body-only)
  (if async (org-pukiwiki-export-to-pukiwiki t subtreep visible-only body-only)
    (org-open-file (org-pukiwiki-export-to-pukiwiki nil subtreep visible-only body-only))))


(provide 'ox-pukiwiki)
;;; ox-pukiwiki.el ends here
