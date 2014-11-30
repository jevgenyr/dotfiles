;; -*- mode: emacs-lisp; -*-

;; Better search suggestions in minibuffer
(ido-mode)

;; Use ibuffer to manage buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Load theme
(load-theme 'Deviant t)

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