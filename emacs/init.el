;; Record the time it takes to load.
(defvar *emacs-load-start* (current-time))
;; Append onto load-path so that they take precedence when loading.
(defun normal-top-level-append-recursively-to-load-path ()
  (setq load-path
        (append
         (let ((load-path (copy-sequence load-path))) ;; Shadow
           (append
            (copy-sequence (normal-top-level-add-to-load-path '(".")))
            (normal-top-level-add-subdirs-to-load-path)))
         load-path)))
;; Non package managed libraries. (recursive includes)
(let ((default-directory "~/.emacs.d/lib"))
  (normal-top-level-append-recursively-to-load-path))
;; Custom emacs code
(let ((default-directory "~/.emacs.d/lisp"))
  (normal-top-level-append-recursively-to-load-path))
;; Contains settings for emacs and various modes/systems/servers
(let ((default-directory "~/.emacs.d/rc"))
  (normal-top-level-append-recursively-to-load-path))
;; Load my default settings
(load "global-settings.el")
;; Load my global functions
(load "global-functions.el")
;; Enable Emacs 24 package manager
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; Display the load time.
(message "Emacs loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
                                 (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))
