(use-package skk
  :ensure ddskk
  :bind
  (("<muhenkan>" . skk-latin-mode)
   ("<henkan>" . skk-j-mode-and-toggle-kana)
   ("S-<muhenkan>" . skk-jisx0208-latin-mode)
   ("S-<henkan>" . skk-toggle-katakana)
   :map skk-j-mode-map
   ("C-M-j" . skk-undo-kakutei))

  :init
  (setq skk-user-directory (expand-file-name "ddskk" my-cache-dir)
        skk-large-jisyo (expand-file-name "skkdict/SKK-JISYO.L" user-emacs-directory)
        skk-use-azik t

        skk-egg-like-newline t
        skk-delete-implies-kakutei nil
        skk-dcomp-activate t
        skk-special-midashi-char-list '(?>)
        skk-auto-okuri-process t
        skk-search-sagyo-henkaku t
        skk-previous-candidate-keys (list "x")

        skk-show-tooltip t
        skk-tooltip-parameters '((background-color . "ForestGreen")
                                 (border-color     . "royal blue")
                                 (foreground-color . "gray")
                                 (internal-border-width . 3))
        skk-show-annotation t
        skk-annotation-delay 0)

  ;; C-j を置き換えない
  (defun skk-remove-kakutei-keymap ()
    (define-key skk-j-mode-map (kbd "C-j") nil)
    (define-key skk-latin-mode-map (kbd "C-j") nil)
    (define-key skk-jisx0208-latin-mode-map (kbd "C-j") nil)
    (define-key skk-abbrev-mode-map (kbd "C-j") nil))
  (advice-add 'skk-setup-keymap :after 'skk-remove-kakutei-keymap)

  ;; skk-azik 用の設定
  (defvar skk-my-unnecessary-base-rule-list
    '("l" "q" "L"))
  (defun skk-my-azik-del-unnecessary-base-rules ()
    (dolist (str skk-my-unnecessary-base-rule-list)
      (setq skk-rom-kana-base-rule-list
            (skk-del-alist str skk-rom-kana-base-rule-list))))
  (defvar skk-my-azik-unnecessary-rule-list
    '("xxa" "xxe" "xxi" "xxo" "xxu" "@" "tU"))
  (defun skk-my-azik-del-unnecessary-rules ()
    (dolist (str skk-my-azik-unnecessary-rule-list)
      (setq skk-rom-kana-rule-list
            (skk-del-alist str skk-rom-kana-rule-list))))
  (defvar skk-my-azik-additional-rom-kana-rule-list
    '(("la" nil ("ァ" . "ぁ"))
      ("le" nil ("ェ" . "ぇ"))
      ("li" nil ("ィ" . "ぃ"))
      ("lo" nil ("ォ" . "ぉ"))
      ("lu" nil ("ゥ" . "ぅ"))
      ("lya" nil ("ャ" . "ゃ"))
      ("lyu" nil ("ュ" . "ゅ"))
      ("lyo" nil ("ョ" . "ょ"))
      ("@" nil skk-today)))
  (defun skk-my-azik-put-additional-rom-kana-rules ()
    (dolist (rule skk-my-azik-additional-rom-kana-rule-list)
      (add-to-list 'skk-rom-kana-rule-list rule)))
  (defun skk-azik-load-hooks ()
    (skk-my-azik-del-unnecessary-base-rules)
    (skk-my-azik-del-unnecessary-rules)
    (skk-my-azik-put-additional-rom-kana-rules))
  (add-hook 'skk-azik-load-hook 'skk-azik-load-hooks)

  :config
  (defun skk-j-mode-and-toggle-kana ()
    (interactive)
    (cond (skk-j-mode
           (skk-toggle-kana nil))
          (t
           (or skk-mode (skk-mode t))
           (skk-j-mode-on)))))
