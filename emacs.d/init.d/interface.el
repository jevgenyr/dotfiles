;; Interface setup

;; Load theme
(if window-system
    (load-theme 'solarized-light t)
  (load-theme 'wombat t))

;; Fringe decorations (margins)
(when (window-system)
  (require 'git-gutter-fringe)
  (global-git-gutter-mode +1))
(setq-default indicate-buffer-boundaries 'left)
(setq-default indicate-empty-lines +1)
;; Plugin: Smart Mode Line
(sml/setup)
(if window-system
    (sml/apply-theme 'light)
  (sml/apply-theme 'dark))
(setq sml/shorten-directory t)
(setq sml/shorten-modes t)

;; Show line number and column in modeline
(setq line-number-mode t)
(setq column-number-mode t)

