;;; 動的な文法エラーチェック

(use-package flycheck
  :ensure flycheck)


;;; 独自 Checker 定義
(flycheck-define-checker php55
  "PHP 5.5 用チェッカー"
  :command ("~/bin/php55" "-l" "-d" "error_reporting=E_ALL" "-d" "display_errors=1"
            "-d" "log_errors=0" source)
  :error-patterns
  ((error line-start (or "Parse" "Fatal" "syntax") " error" (any ":" ",") " "
          (message) " in " (file-name) " on line " line line-end))
  :modes (php-mode php+-mode)
  :next-checkers ((warning . php-phpmd)
                  (warning . php-phpcs)))


;;; プロジェクトによって checker を変更する
(defvar flycheck-php55-projects
  '("sfida_tools")
  "PHP 5.5 で文法チェックを行う (projectile の) プロジェクト名")

(defun flycheck-mode-hooks ()
  (interactive)
  (if (eq major-mode 'php-mode)
      (cond ((member (projectile-project-name) flycheck-php55-projects)
             (flycheck-select-checker 'php55)))))

(add-hook 'find-file-hooks 'flycheck-mode-hooks)
