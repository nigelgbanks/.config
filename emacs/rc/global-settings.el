;; Platform Defaults
;;------------------------------------------------------------------------------
(load "global-keymap.el")
(load "platform.el")
;; Emacs Settings
;;------------------------------------------------------------------------------
;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-message t)  ;; No splash screen
(setq make-backup-files nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq indent-tabs-mode nil) ;; Always use spaces
(setq js-indent-level 2)
(setq c-basic-offset 2)
(setq fill-column 80)
(setq show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(global-auto-revert-mode 1) ;; Auto refresh buffers
(setq global-auto-revert-non-file-buffers t) ;; Also auto refresh dired
(setq auto-revert-verbose nil) ;; but be quiet about it
(setq vc-make-backup-files t) ;; Make backups of files, even when they're in version control
(setq make-backup-files nil) ;; Stop creating those backup~ files
(setq auto-save-default nil) ;; Stop creating those #auto-save# files
(setq backup-directory-alist ;; Write backup files to own directory
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))
;; Load CEDET
;;------------------------------------------------------------------------------
(require 'cedet)
(global-ede-mode 1)                      ; Enable the Project management system
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
(global-srecode-minor-mode 1)            ; Enable template insertion menu
;; Show line numbers when using goto.
(global-set-key [remap goto-line] 'goto-line-with-feedback)
(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))
;; Open zsh files in sh-mode
(add-hook 'find-file-hooks
          (lambda ()
            (let ((file (buffer-file-name)))
              (when (and file (equal (file-name-directory file) "/home/nbanks/.zsh.d/"))
                (sh-mode)))))
;; IDO Settings
(ido-mode t) ;; Switch buffer / Find file autocomplete
(setq ido-enable-flex-matching t)
(add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-file-completion-map "\t" 'ido-next-match)
            (define-key ido-file-completion-map [backtab] 'ido-prev-match)
            (define-key ido-buffer-completion-map "\t" 'ido-next-match)
            (define-key ido-buffer-completion-map [backtab] 'ido-next-match)))
(add-hook 'ido-setup-hook ;; Jump to home from any depth
 (lambda ()
   ;; Go straight home
   (define-key ido-file-completion-map
     (kbd "~")
     (lambda ()
       (interactive)
       (if (looking-back "/")
           (insert "~/")
         (call-interactively 'self-insert-command))))))
;; NXML Settings
(add-hook 'nxml-mode-hook
          (lambda () (setq indent-tabs-mode nill)))
;; Markdown Mode Settings
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
;; Whitespace Settings
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)
;; Dired
(setq ibuffer-saved-filter-groups (quote (("default" ("dired" (mode . dired-mode)))))) ;; Group Dired buffers in iBuffer
(setq-default dired-listing-switches "-alhv") ;; Make sizes human-readable by default, sort version numbers correctly, and put dotfiles and capital-letters first.
(setq dired-recursive-copies 'always)
;; Java
(require 'jdibug)
(add-hook 'java-mode-hook
          (lambda()
            (setq indent-tabs-mode nil)
            (setq c-basic-offset 4)
            ))
