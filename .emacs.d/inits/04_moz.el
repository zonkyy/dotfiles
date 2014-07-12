;;;; Firefox を Emacs で操作する


;;; (install-elisp "https://raw.github.com/bard/mozrepl/master/chrome/content/moz.el")
(autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)
(moz-minor-mode t)


(defun moz-send-message (moz-command)
  (comint-send-string
   (inferior-moz-process)
   (concat moz-repl-name ".pushenv('printPrompt', 'inputMode'); "
           moz-repl-name ".setenv('inputMode', 'line'); "
           moz-repl-name ".setenv('printPrompt', false); undefined; "))
  (comint-send-string
   (inferior-moz-process)
   (concat moz-command
           moz-repl-name ".popenv('inputMode', 'printPrompt'); undefined;\n")))


(defun moz-scrolldown-1 ()
  (interactive)
  (moz-send-message "goDoCommand('cmd_scrollLineDown');\n"))

(defun moz-scrolldown ()
  (interactive)
  (moz-send-message "goDoCommand('cmd_scrollPageDown');"))

(defun moz-scrollup-1 ()
  (interactive)
  (moz-send-message "goDoCommand('cmd_scrollLineUp');\n"))

(defun moz-scrollup ()
  (interactive)
  (moz-send-message "goDoCommand('cmd_scrollPageUp');"))

(defun moz-top ()
  (interactive)
  (moz-send-message "goDoCommand('cmd_scrollTop');\n"))

(defun moz-bottom ()
  (interactive)
  (moz-send-message "goDoCommand('cmd_scrollBottom');\n"))

(defun moz-tab-previous ()
  (interactive)
  (moz-send-message "getBrowser().mTabContainer.advanceSelectedTab(-1, true);\n"))

(defun moz-tab-next ()
  (interactive)
  (moz-send-message "getBrowser().mTabContainer.advanceSelectedTab(1, true);\n"))
