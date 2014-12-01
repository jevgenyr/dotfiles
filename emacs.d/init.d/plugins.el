;; Plugin specific configs

;; Projectile - Helm - Perspective
;; Activate
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(require 'helm-projectile)
(helm-projectile-on)
;; When opening a project use helm not default find-file
(setq projectile-switch-project-action 'helm-projectile-find-file)
;; Simple kbding
(global-set-key (kbd "s-t") 'helm-projectile)

;; Perpective - Per project workspaces integrates with projectile
(persp-mode)
(require 'persp-projectile)
(setq projectile-mode-line '(:eval (format " PRJ[%s]" (projectile-project-name))))
;; Kbdings
(define-key projectile-mode-map (kbd "C-c s s") 'projectile-persp-switch-project)
(define-key projectile-mode-map (kbd "s-s") 'projectile-persp-switch-project)

;; uniquify
;; (ensure all buffer has unique names by including parent if needed)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
