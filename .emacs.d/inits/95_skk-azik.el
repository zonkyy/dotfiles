;;;; skk-azik 用設定

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
