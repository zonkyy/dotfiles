;;;; Linux 用の設定


;;; 言語・文字コード関連の設定
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq file-name-coding-system 'utf-8)


;;; フォント設定
(set-frame-font "ricty-10.5")


;;; フレームサイズ・位置・色などの設定
(setq default-frame-alist
      (append (list '(foreground-color . "gray80")
                    '(background-color . "black")
                    '(border-color . "black")
                    '(mouse-color . "white"))
              default-frame-alist))


;;; emacsclientw.exe を使用して外部からemacsにファイルを渡せるようにする
(require 'server)
(or (server-running-p) (server-start))


;;; コピー/ペースト をクリップボードと共有
(setq x-select-enable-clipboard t)
(global-set-key (kbd "C-y") 'x-clipboard-yank)
