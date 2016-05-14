;;;; 同じキーの連続入力で、入力候補を変更する

(use-package key-combo
  :ensure t)
(global-key-combo-mode t)

(defun my-key-combo-braces ()
  (let ((beg))
    (setq beg (point))
    (insert "{\n\n}")
    (indent-region beg (point))
    (forward-line -1)
    (indent-according-to-mode)
    (goto-char (point-at-eol))))

(defun my-key-combo-semicolon ()
  (indent-according-to-mode)
  (insert ";")
  (newline-and-indent))

;;; Ruby
(setq key-combo-ruby-default
      '((","  . (", " key-combo-execute-orignal))
        ("="  . (" = " " == " " === " key-combo-execute-orignal))
        ("~"  . (" =~ " key-combo-execute-orignal))
        ("+"  . (" + " " += " key-combo-execute-orignal))
        ("-"  . (" - " " -= " key-combo-execute-orignal))
        (">"  . (" > " " => " " >= " "->" key-combo-execute-orignal))
        ("%"  . (" % " " %= " key-combo-execute-orignal))
        ("!"  . (" != " " !~ " key-combo-execute-orignal))
        ("&"  . (" & " " && " key-combo-execute-orignal))
        ("*"  . (" * " "**" key-combo-execute-orignal))
        ("<"  . (" < " " << " " <= " key-combo-execute-orignal))
        ("|"  . ("|`!!'|" " ||= " " || " key-combo-execute-orignal))
        ("/"  . (key-combo-execute-orignal "/`!!'/" " / " "// "))
        ("#"  . ("#{`!!'}" key-combo-execute-orignal))
        ("("  . (key-combo-execute-orignal "("))
        ("["  . (key-combo-execute-orignal "["))
        ("{"  . (key-combo-execute-orignal "{|`!!'|  }" "{"))
        ("'"  . (key-combo-execute-orignal "'"))
        ("\"" . (key-combo-execute-orignal "\""))))

(key-combo-define-hook '(ruby-mode-hook)
                       'key-combo-ruby-load-default
                       key-combo-ruby-default)

;;; C/C++
(setq key-combo-c-default
      '((";"  . (my-key-combo-semicolon key-combo-execute-orignal))
        (","  . (", " key-combo-execute-orignal))
        ("="  . (" = " " == " key-combo-execute-orignal))
        ("+"  . (" + " "++" " += " key-combo-execute-orignal))
        ("-"  . (" - " "--" " -= " key-combo-execute-orignal))
        (">"  . (" > " " >> " " >= " "->" key-combo-execute-orignal))
        ("%"  . (" % " " %= " key-combo-execute-orignal))
        ("!"  . (" != " key-combo-execute-orignal))
        ("&"  . (" && " " & " key-combo-execute-orignal))
        ("*"  . ("*" " * " " *= "))
        ("<"  . (" < " " << " " <= " key-combo-execute-orignal))
        ("|"  . (" || " " |= " key-combo-execute-orignal))
        ("/"  . (key-combo-execute-orignal " / " " /= "))
        ("("  . (key-combo-execute-orignal "("))
        ("["  . (key-combo-execute-orignal "["))
        ("{"  . (my-key-combo-braces key-combo-execute-orignal "{"))
        ("'"  . (key-combo-execute-orignal "'"))
        ("\"" . (key-combo-execute-orignal "\""))))

(key-combo-define-hook '(c-mode-hook c++-mode-hook)
                       'key-combo-c-load-default
                       key-combo-c-default)

;;; PHP
(setq key-combo-php-default
      '((";"  . (my-key-combo-semicolon key-combo-execute-orignal))
        ("."  . (key-combo-execute-orignal " . " " .= "))
        (","  . (", " key-combo-execute-orignal))
        ("="  . (" = " " == " " === " key-combo-execute-orignal))
        ("+"  . (" + " "++" " += " key-combo-execute-orignal))
        ("-"  . (" - " "--" " -= " key-combo-execute-orignal))
        (">"  . (" > " "->" " => " " >= " key-combo-execute-orignal))
        ("%"  . (" % " " %= " key-combo-execute-orignal))
        ("!"  . (" != " key-combo-execute-orignal))
        ("&"  . (" && " " & " " &= " key-combo-execute-orignal))
        ("*"  . (" * " " *= " "**" key-combo-execute-orignal))
        ("<"  . (" < " " << " " <= " key-combo-execute-orignal))
        ("|"  . (" || " " |= " key-combo-execute-orignal))
        ("/"  . (" / " " /= " "/`!!'/" key-combo-execute-orignal))
        ("("  . (key-combo-execute-orignal "("))
        ("["  . (key-combo-execute-orignal "["))
        ("{"  . (my-key-combo-braces key-combo-execute-orignal "{"))
        ("'"  . (key-combo-execute-orignal "'"))
        ("\"" . (key-combo-execute-orignal "\""))))

(key-combo-define-hook '(php-mode-hook)
                       'key-combo-php-load-default
                       key-combo-php-default)

;;; JavaScript
(setq key-combo-js-default
      '((";"  . (my-key-combo-semicolon key-combo-execute-orignal))
        (","  . (", " key-combo-execute-orignal))
        ("="  . (" = " " == " " === " key-combo-execute-orignal))
        ("+"  . (" + " "++" " += " key-combo-execute-orignal))
        ("-"  . (" - " "--" " -= " key-combo-execute-orignal))
        (">"  . (" > " " => " " >= " key-combo-execute-orignal))
        ("%"  . (" % " " %= " key-combo-execute-orignal))
        ("!"  . (" != " key-combo-execute-orignal))
        ("&"  . (" && " " & " " &= " key-combo-execute-orignal))
        ("*"  . (" * " " *= " "**" key-combo-execute-orignal))
        ("<"  . (" < " " << " " <= " key-combo-execute-orignal))
        ("|"  . (" || " " |= " key-combo-execute-orignal))
        ("/"  . (" / " " /= " "/`!!'/" key-combo-execute-orignal))
        ("("  . (key-combo-execute-orignal "("))
        ("["  . (key-combo-execute-orignal "["))
        ("{"  . (my-smartchr-braces key-combo-execute-orignal "{"))
        ("'"  . (key-combo-execute-orignal "'"))
        ("\"" . (key-combo-execute-orignal "\""))))

(key-combo-define-hook '(js2-mode)
                       'key-combo-js-load-default
                       key-combo-js-default)

;;; eRuby
(add-hook 'projectile-rails-mode-hook
          '(lambda ()
             (cond ((eq major-mode 'web-mode)
                    (key-combo-define-local (kbd "<") '("<%= `!!' %>" "<% `!!' %>" key-combo-execute-orignal))))))
