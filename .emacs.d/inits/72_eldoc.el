;;;; elisp編集時，カーソル位置の関数の仮引数をエコーエリアに表示

(use-package eldoc)
(use-package eldoc-extension
  :ensure eldoc-extension)
(setq eldoc-idle-delay 0.20)
(setq eldoc-echo-area-use-multiline-p t)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
