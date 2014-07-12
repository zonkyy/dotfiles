;;;; Emacs で DB を操作する


;;; (install-package 'edbi)
(require 'edbi)
(setenv "PERL5LIB" "/home/akisute/perl5/lib/perl5")
(setq edbi:ds-history-file "~/.emacs.cache/.edbi-ds-history")
