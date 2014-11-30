;; -*- mode: emacs-lisp; -*-

;; Initialize Cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; Require config files
(load-file "~/emacs.d/Deviant-theme.el")
(load-file "~/emacs.d/sticky-window.el")

;; -------------
;; Behaviors
;; -------------
;; Better search suggestions in minibuffer
(ido-mode)
;; No init screen, we know our stuff
(setq inhibit-startup-screen +1)
;; Default scrolling is a bit wonky, fix it
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)
;; Fix mouse scrolling (follow mouse and 1 line at the time)
(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
;; Plugin: uniquify (ensure all buffer has unique
;; names by including parent if needed)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; -------------
;; Key bindings
;; -------------
;; Use ibuffer to manage buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; Use sticky windows allowing `C-x 9` to keep a window open
(require 'sticky-windows)
(global-set-key     [(control x) (?0)]        'sticky-window-delete-window)
(global-set-key     [(control x) (?1)]        'sticky-window-delete-other-windows)
(global-set-key     [(control x) (?9)]        'sticky-window-keep-window-visible)

;; -------------
;; Interface
;; -------------
;; Load theme
(load-theme 'Deviant t)
;; Less clutter
(when (window-system)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))
;; In terminal remove menu bar
(when (not (window-system))
  (menu-bar-mode -1))
;; Fringe decorations (margins)
(when (window-system)
  (require 'git-gutter-fringe)
  (global-git-gutter-mode +1))
(setq-default indicate-buffer-boundaries 'left)
(setq-default indicate-empty-lines +1)
;; Plugin: Smart Mode Line
(sml/setup)
(sml/apply-theme 'dark)
(setq sml/shorten-directory t)
(setq sml/shorten-modes t)

;; File saving / backup optimizations
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; Load custom settings to this machine
(setq custom-file "~/.emacs.d/custom.el")
(if (file-exists-p custom-file)
    (load custom-file))
