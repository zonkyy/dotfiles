;;;; Emacs で gtags (GNU GLOBAL) を扱う

(use-package ggtags
  :ensure ggtags)

(add-hook 'c-mode-common-hook 'ggtags-mode)
