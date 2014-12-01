;; -*- mode: emacs-lisp; -*-

;; Set up identity
(setq user-full-name "Frederic Gingras")
(setq user-mail-address "frederic@gingras.cc")

;; Include Common Lisp, emacs lisp being only a subset
(eval-when-compile (require 'cl))

;; Load custom settings to this machine
(setq custom-file "~/.emacs.d/custom.el")
(if (file-exists-p custom-file)
    (load custom-file))

;; Load config files
(load-file "~/.emacs.d/vendor/sticky-window.el")
(load-file "~/.emacs.d/vendor/color-theme.el")
(load-file "~/.emacs.d/vendor/wombat-theme.el")

(load-file "~/.emacs.d/init.d/packages.el")
(load-file "~/.emacs.d/init.d/startup.el")
(load-file "~/.emacs.d/init.d/keybindings.el")
(load-file "~/.emacs.d/init.d/interface.el")
(load-file "~/.emacs.d/init.d/languages.el")
(load-file "~/.emacs.d/init.d/erc.el")
