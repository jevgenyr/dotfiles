;; Key-bindings setup

(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-,") 'kill-whole-line)

;; Plugin: Maggit keybindings
(global-set-key (kbd "C-c g") 'magit-status)

;; Use ibuffer to manage buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x b") 'ido-switch-buffer)

;; In file symbol navigation like "C-r" in Sublime Text
(global-set-key (kbd "M-i") 'ido-goto-symbol)

;; Use sticky windows allowing `C-x 9` to keep a window open
(require 'sticky-windows)
(global-set-key     [(control x) (?0)]        'sticky-window-delete-window)
(global-set-key     [(control x) (?1)]        'sticky-window-delete-other-windows)
(global-set-key     [(control x) (?9)]        'sticky-window-keep-window-visible)

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
