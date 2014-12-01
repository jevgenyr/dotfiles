;; Startup & emacs defaults setup

;; Don't use messages that you don't read
(setq initial-scratch-message "")
(setq inhibit-startup-message t)
;;(setq initial-major-mode 'org-mode)

;; Less clutter (scollbars, menus, fs)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

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

;; Make text-selection work more normally (useful for pairing)
;; Delete selected region when we write and have something selected
(delete-selection-mode t)
;; Make common highligthing keystrokes work
(transient-mark-mode t)
;; Make emacs and mac's clipboard be friends
(setq x-select-enable-clipboard t)

;; Tab width and use spaces
(setq tab-width 2)
(setq indent-tabs-mode nil)

;; Turn off backupfiles, I don't use them so y even put then in a folder
(setq make-backup-files nil)
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Prompts are anoying, at least have y/n always be y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; Better search suggestions in minibuffer
(setq ido-enable-flex-matching t)
(ido-mode +1)

;; Prevent the cursor from blinking
(blink-cursor-mode 0)

;; Always show matching parens
(show-paren-mode t)

;; On mac, let the right alt alone and ensure right alt is meta
(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)

;; When a file doesn't exist, don't confirm it creation!
(setq confirm-nonexistent-file-or-buffer nil)

;; Don't confim the killing of a buffer with an active process
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
         kill-buffer-query-functions))

;; When using "C-n" make it create new lines like "o" in vim
(setq next-line-add-newlines t)

;; Use Shift+<arrow> to move around windows
(windmove-default-keybindings)
;; when cursor is on edge, move to the other side, as in a toroidal space
(setq windmove-wrap-around t)
