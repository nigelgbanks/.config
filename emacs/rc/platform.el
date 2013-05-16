; System Settings
(if (eq system-type 'darwin)
    (load "darwin.el"))
(if (eq system-type 'gnu/linux)
    (load "linux.el"))
; Server Settings
;(if (string= (daemonp) "dgi")
(load "dgi.el"); For now we will always load dgi.el
