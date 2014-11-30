;; -*- mode: emacs-lisp; -*-

;; Initialize Cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; Require config files
(load-file "~/.emacs.d/Deviant-theme.el")
(load-file "~/.emacs.d/sticky-window.el")

;; Load custom settings to this machine
(setq custom-file "~/.emacs.d/custom.el")
(if (file-exists-p custom-file)
    (load custom-file))

;; -------------
;; Behaviors
;; -------------

;; File saving / backup optimizations
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; Better search suggestions in minibuffer
(setq ido-enable-flex-matching t)
(ido-mode +1)

;; Prevent the cursor from blinking
(blink-cursor-mode 0)

;; Don't use messages that you don't read
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

;; Don't let Emacs hurt your ears
(setq visible-bell t)

;; Default scrolling is a bit wonky, fix it
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

;; Fix mouse scrolling (follow mouse and 1 line at the time)
(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; Allow scrolling to go to bottom of file instead of error
(setq scroll-error-top-bottom t)

;; Plugin: uniquify (ensure all buffer has unique
;; names by including parent if needed)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; On mac, let the right alt alone and ensure right alt is meta
(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)

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
;; Plugin: smex (file opening)
(global-set-key (kbd "M-x") 'smex)
;; Kill line shortcut
(global-set-key (kbd "C-,") 'kill-whole-line)
;; Plugin: Maggit keybindings
(global-set-key (kbd "C-c g") 'magit-status)
;; Smarter beginning of line
(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

  Move point to the first non-whitespace character on this line.
  If point is already there, move to the beginning of the line.
  Effectively toggle between the first non-whitespace character and
  the beginning of the line.

  If ARG is not nil or 1, move forward ARG - 1 lines first.  If
  point reaches the beginning or end of the buffer, stop there."
   (interactive "^p")
   (setq arg (or arg 1))

   ;; Move lines first
   (when (/= arg 1)
       (let ((line-move-visual nil))
         (forward-line (1- arg))))

   (let ((orig-point (point)))
       (back-to-indentation)
       (when (= orig-point (point))
         (move-beginning-of-line 1))))
;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
		   'smarter-move-beginning-of-line)
;; tilde goes to home in ido mode
(add-hook 'ido-setup-hook
  (lambda ()
    ;; Go straight home
    (define-key ido-file-completion-map
      (kbd "~")
      (lambda ()
        (interactive)
        (if (looking-back "/")
          (insert "~/")
          (call-interactively 'self-insert-command))))))

;; -------------
;; Interface
;; -------------
;; Load theme
(load-theme 'cyberpunk t)
;; Less clutter (scollbars, menus, fs)
(toggle-frame-fullscreen) 
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode 0)
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
