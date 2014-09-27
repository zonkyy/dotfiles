;;;; 移動したい場所にカーソルを直接移動する

(use-package ace-jump-mode
  :ensure ace-jump-mode)
(global-set-key (kbd "C-o") 'ace-jump-mode)


;;; 頭文字入力無しの ace-jump-word-mode
(defun ace-jump-word-mode-unuse-query-char(&optional prefix)
  (interactive "p")
  (let ((ace-jump-word-mode-use-query-char nil))
    (ace-jump-mode prefix)))
(global-set-key (kbd "C-S-o") 'ace-jump-word-mode-unuse-query-char)


;;; ヒント文字の割り当ての変更
(defconst ace-jump-mode-move-keys-by-case
  (cons (reverse (append "asdfghjkl;:]" nil))
        (reverse (append "asdfghjkl;:]qwertyuiop@zxcvbnm,." nil))))

(defadvice ace-jump-search-candidate (after sort-by-distance activate)
  "距離が近ければ近いほど押しやすいヒント文字を割り当てる"
  (setq ad-return-value
        (loop with cands = (length ad-return-value)
              with homeposition-keys = (length (car ace-jump-mode-move-keys-by-case))
              with keys = (length (cdr ace-jump-mode-move-keys-by-case))
              with fdistance = (lambda (p) (abs (- (point) (or (aj-position-offset p) 0))))
              ;; これらのコマンドで到達できる場所は除外するよう位置を計算しておく
              with exceptions = (loop for func in '(ignore beginning-of-line forward-char backward-word)
                                      collect (save-excursion (ignore-errors (call-interactively func))
                                                              (point)))
              ;; カレントバッファ内の位置はpl-thiswinに
              ;; 他のウィンドウでの位置はpl-otherwinに分ける
              for position in ad-return-value
              if (eq (aj-position-window position) (selected-window))
              ;; 除外する場所に該当しなければ登録
              collect (unless (memq (aj-position-offset position) exceptions) position) into pl-thiswin
              else collect position into pl-otherwin
              finally do
              ;; ヒント文字の数によって場合分け
              ;; 最短距離からasdf～と割り当てる
              (setq ace-jump-mode-move-keys
                    (typecase cands
                      ((integer 2 homeposition-keys)
                       (last (car ace-jump-mode-move-keys-by-case) cands))
                      ((integer homeposition-keys keys)
                       (last (cdr ace-jump-mode-move-keys-by-case) cands))
                      (t
                       (cdr ace-jump-mode-move-keys-by-case))))
              ;; カレントバッファ内の位置を選択しやすくするためにソートする
              (return (append pl-otherwin (sort* (delq nil pl-thiswin) #'> :key fdistance))))))
