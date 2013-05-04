(require 'php-mode)
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
