(let ((default-directory "~/.emacs.d/lib/drupal-mode"))
  (normal-top-level-add-to-load-path '(".")))
(require 'drupal-mode)
(require 'tramp)
(setq tramp-default-method "sshx")
(autoload 'geben "geben" "PHP Debugger on Emacs" t)
(add-hook 'php-mode-hook 'drupal-mode) ; Enbale Drupal minor mode.
(add-hook 'php-mode-hook ; Apply drupal coding standards to the document.
          (lambda()
            (add-hook 'local-write-file-hooks
                      '(lambda ()
                         (save-excursion
                           (replace-regexp "else[ \t]if" "elseif" nil (point-min) (point-max))
                           (replace-regexp "\\(foreach\\|\\for\\|if\\|while\\|switch\\)[ \t]*(\\(.*\\))[ \t]*{" "\\1 (\\2) {" nil (point-min) (point-max))
                           (replace-regexp "do[ \t]*{" "do {" nil (point-min) (point-max))
                           (replace-regexp "}[ \t]*while[ \t]*(\\(.*\\))[ \t]*;" "} while (\\1);" nil (point-min) (point-max)))))
            (set (make-local-variable 'compile-command) (format "phpcs --report=emacs --standard=/usr/share/php/PHP/CodeSniffer/Standards/Drupal/ruleset.xml --extensions=php,module,inc,install,test,profile,theme %s" (buffer-file-name)))))


(add-hook 'java-mode-hook
          (lambda ()
            (add-hook 'local-write-file-hooks
                      '(lambda ()
                         (save-excursion
                           (replace-regexp "\\(for\\|if\\|while\\|switch\\)[ \t]*(\\(.*\\))[ \t]*{" "\\1 (\\2) {" nil (point-min) (point-max))
                           (replace-regexp "do[ \t]*{" "do {" nil (point-min) (point-max))
                           (replace-regexp "}[ \t]*while[ \t]*(\\(.*\\))[ \t]*;" "} while (\\1);" nil (point-min) (point-max)))))))
(add-hook 'java-mode-hook
          (lambda ()
            "Treat Java 1.5 @-style annotations as comments."
            (setq c-comment-start-regexp "(@|/(/|[*][*]?))")
            (modify-syntax-entry ?@ "< b" java-mode-syntax-table)
            (c-set-offset 'case-label '+)
            (set (make-local-variable 'compile-command) (format "checkstyle %s" (buffer-file-name)))
            ))
