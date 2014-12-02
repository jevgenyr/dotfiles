;; Packages setup

(load "package")
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq package-archive-enable-alist '(("melpa" deft magit)))

(defvar kiasaki/packages '(
			   ;; Package manager
			   marmalade 

			   ;; Git commands
			   magit
			   ;; Edit GitHub gists
			   gist
			   ;; Allow execution of HTTP call (replaces curl)
			   restclient
			   ;; Smarter mode line
			   smart-mode-line
			   smart-mode-line-powerline-theme
			   ;; Git fringes!
			   git-gutter-fringe
			   ;; "a kind of ido" mode for 'M-x' with history
			   smex
			   ;; Org mode (productivity apps)
			   org
			   ;; "C-p" sublime text like file/buffer/history opening
			   projectile
			   helm
			   helm-projectile
			   ;; Per project workspaces
			   perspective
			   ;; Window session managment
			   elscreen
			   ;; My theme
			   solarized-theme
			   
			   ;; Languages major modes (self-explanatory)
			   
			   ;; Go
			   go-mode
			   ;; Ruby
			   rvm
			   coffee-mode
			   haml-mode
			   yaml-mode
			   ;; Nodejs
			   stylus-mode
			   jade-mode
			   ;; PHP
			   php-mode
			   ;; Other
			   web-mode
			   markdown-mode
			   twittering-mode
			   writeroom-mode)
  "Default packages")

;; Install default packages
(defun kiasaki/packages-installed-p ()
  (loop for pkg in kiasaki/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (kiasaki/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg kiasaki/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))
