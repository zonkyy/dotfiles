;;; 変換/無変換キーでSKKのモードを変更する設定


;;; ひらがなとカタカナのトグル
(defun skk-j-mode-and-toggle-kana ()
  (interactive)
  (cond (skk-j-mode
         (skk-toggle-kana nil))
        (t
         (skk-j-mode-on))))


;;; 変換/無変換キーで対応したキー設定削除
(defun skk-load-hooks ()
  ;; キーでモードを変更しない
  (defvar skk-my-unnecessary-base-rule-list
    '("l" "q" "L"))
  (dolist (str skk-my-unnecessary-base-rule-list)
    (setq skk-rom-kana-base-rule-list
          (skk-del-alist str skk-rom-kana-base-rule-list))))

(add-hook 'skk-load-hook 'skk-load-hooks)


;;; 変換/無変換キーで対応したazik専用キー設定削除
(defun skk-azik-load-hooks ()
  ;; 1. l, q が使えないことによる変更を戻す
  ;; 2. tU で「っ」になるのを防ぐ
  (defvar skk-my-azik-unnecessary-rule-list
    '("xxa" "xxe" "xxi" "xxo" "xxu" "@" "tU"))
  (dolist (str skk-my-azik-unnecessary-rule-list)
    (setq skk-rom-kana-rule-list
          (skk-del-alist str skk-rom-kana-rule-list)))
  ;; l を使った小文字入力など
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
  (dolist (rule skk-my-azik-additional-rom-kana-rule-list)
    (add-to-list 'skk-rom-kana-rule-list rule)))

(add-hook 'skk-azik-load-hook 'skk-azik-load-hooks)


;;; キー割り当て
(global-set-key (kbd "<zenkaku-hankaku>") 'skk-mode)
(global-set-key (kbd "<muhenkan>") 'skk-latin-mode)
(global-set-key (kbd "<henkan>") 'skk-j-mode-and-toggle-kana)
(global-set-key (kbd "S-<muhenkan>") 'skk-jisx0208-latin-mode)
(global-set-key (kbd "S-<henkan>") 'skk-toggle-katakana)
