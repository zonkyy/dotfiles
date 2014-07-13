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


;;; ratio: ページに対するスクロール量の割り合い (100 で PageDown)
;;; time: アニメーション時間．高いほどゆっくりスクロール．デフォルト 100．
(defun moz-scroll-down-internal (ratio &optional time)
  (setq time (or time 100))
  (moz-send-message
   (concat "(function(){var t=" (number-to-string time)
           ",r=" (number-to-string ratio)
           " ;var i=0,w =document.documentElement,"
           "s=gBrowser.selectedBrowser.contentWindow.scrollY,"
           "e=s+w.clientHeight/(100/r),v=(e-s)/t,c=s;for(i;i<t;i++)"
           "{setTimeout(function(){c+=v;content.scrollTo(0,c);},i+1)}})();")))

(defun moz-scroll-up-internal (ratio &optional time)
  (setq time (or time 100))
  (moz-send-message
   (concat "(function(){var t=" (number-to-string time)
           ",r=" (number-to-string ratio)
           " ;var i=0,w =document.documentElement,"
           "s=gBrowser.selectedBrowser.contentWindow.scrollY,"
           "e=s+w.clientHeight/(100/r),v=(e-s)/t,c=s;for(i;i<t;i++)"
           "{setTimeout(function(){c-=v;content.scrollTo(0,c);},i+1)}})();")))


(defun moz-scrolldown-10 ()
  (interactive)
  (moz-scroll-down-internal 10))

(defun moz-scrolldown-50 ()
  (interactive)
  (moz-scroll-down-internal 50))

(defun moz-scrolldown-100 ()
  (interactive)
  (moz-scroll-down-internal 100))

(defun moz-scrollup-10 ()
  (interactive)
  (moz-scroll-up-internal 10))

(defun moz-scrollup-50 ()
  (interactive)
  (moz-scroll-up-internal 50))

(defun moz-scrollup-100 ()
  (interactive)
  (moz-scroll-up-internal 100))

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
