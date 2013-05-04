(require 'package) ; Enable Emacs 24 package manager
(package-initialize)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'load-path "~/.emacs.d/rc") ; Settings for emacs and various modes/systems/servers
(let ((default-directory "~/.emacs.d/lisp"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path)) ; Custom emacs code. (recursive includes)
(let ((default-directory "~/.emacs.d/lib"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path)) ; Non package managed libraries, packed libraries take precedence over these. (recursive includes)
(load "global-settings.el") ; Load my default settings
(load "global-functions.el") ; Load my global functions
