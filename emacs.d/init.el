(require 'package)
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(evil
    helm
    projectile
    helm-projectile
    arjen-grey-theme))

(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path (concat user-emacs-directory "config"))

;;;;;;;;;;;;;;;
;; Emacs
(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

; Better word wrapping
(visual-line-mode 1)
; Simpler title
(setq frame-title-format "Emacs")
; Enforce new lines
(setq require-final-newline t)

(when window-system
  (set-face-attribute 'mode-line nil
                      :family "Source Code Pro"
                      :weight 'light
                      :height 100))

(when (fboundp 'mac-option-key-is-meta) (setq mac-option-key-is-meta t))
(when (fboundp 'mac-right-option-modifier) (setq mac-right-option-modifier nil))

; No toolbar
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
; No lockfile
(setq create-lockfiles nil)
; No tabs
(setq-default indent-tabs-mode nil)
; No right fringe
(when (fboundp 'set-fringe-style) (set-fringe-style '(8 . 0)))
; No test in initial scratch buffer
(setq initial-scratch-message nil)
; No scroll bars
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
; No menu bar
(menu-bar-mode -1)
; No audible bell
(setq visible-bell t)
(setq ring-bell-function 'ignore)
; Column numbers in status line
(column-number-mode)
; Line number in left fringe
(global-linum-mode t)
; Easier to write answers
(defalias 'yes-or-no-p 'y-or-n-p)
; Use a bigger mark ring
(setq mark-ring-max 64)
(setq global-mark-ring-max 128)
; Automagically load changes on disk to file
(global-auto-revert-mode 1)
;; Highlights matching parenthesis
(show-paren-mode 1)
;; Highlight current line
(global-hl-line-mode 1)

; Don't little tree with saves
(defvar my-auto-save-folder "~/.emacs.d/.saves/"
  "Directory used for Emacs backups.")

  (setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
  (setq auto-save-file-name-transforms
        `((".*" ,my-auto-save-folder t)))

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-=") 'text-scale-set)


;; comments
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-;") 'toggle-comment-on-line)

;; use 2 spaces for tabs
(defun die-tabs ()
  (interactive)
  (set-variable 'tab-width 2)
  (mark-whole-buffer)
  (untabify (region-beginning) (region-end))
  (keyboard-quit))

;;;;;;;;;;;;;;;
;; Evil

(setq evil-want-C-u-scroll t)
(setq evil-want-fine-undo t)
(setq evil-want-change-word-to-end t)
(setq evil-search-module 'isearch)
(setq evil-magic 'very-magic)

(require 'evil)
(evil-mode 1)

(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

(define-key evil-normal-state-map (kbd "SPC a") 'helm-find-files)
(define-key evil-normal-state-map (kbd "SPC f") 'helm-projectile)

;(evil-leader/set-leader " ")

;;;;;;;;;;;;;;;
;; Helm
(require 'helm)
(require 'helm-config)

(global-set-key (kbd "C-x C-f") 'helm-find-files)

(setq helm-M-x-fuzzy-match t)
(global-set-key (kbd "M-x") 'helm-M-x)

(setq helm-buffers-fuzzy-matching t
            helm-recentf-fuzzy-match t)
(global-set-key (kbd "C-x b") 'helm-mini)

;;;;;;;;;;;;;;;
;; Projectile
(require 'projectile)
(projectile-global-mode)
(require 'helm-projectile)

;;;;;;;;;;;;;;;
;; Theme
(load-theme 'arjen-grey t)

;; Custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-vsplit-window-right t)
 '(ns-right-alternate-modifier (quote none)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
