;; ERC Setup
(setq erc-keywords '("@frederic" "@kiasaki" "@all" "@everyone"))

;; Flowdock
(defun erc-flowdock ()
  (interactive)
  (erc-tls :server "irc.flowdock.com" :port 6697 :nick "frederic"))
(global-set-key "\C-ceb" 'erc-flowdock)

;; Freeode
(defun erc-freenode ()
  (interactive)
  (erc-tls :server "irc.freenode.com" :port 6697 :nick "kiasaki"))
(global-set-key "\C-cef" 'erc-freenode)
(setq erc-autojoin-channels-alist '(("freenode.net" "#emacs" "#golang")))
