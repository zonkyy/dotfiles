;;; 変換/無変換キーでSKKのモードを変更する設定

;;; ひらがなとカタカナのトグル
(defun skk-j-mode-and-toggle-kana ()
  (interactive)
  (cond (skk-j-mode
         (skk-toggle-kana nil))
        (t
         (or skk-mode (skk-mode t))
         (skk-j-mode-on))))




;;; キー割り当て
(global-set-key (kbd "<muhenkan>") 'skk-latin-mode)
(global-set-key (kbd "<henkan>") 'skk-j-mode-and-toggle-kana)
(global-set-key (kbd "S-<muhenkan>") 'skk-jisx0208-latin-mode)
(global-set-key (kbd "S-<henkan>") 'skk-toggle-katakana)
