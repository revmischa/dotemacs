(require 'rcirc)

(setq rcirc-server-alist
      '(("irc.freenode.net" :port 6697 :encryption tls
	 :channels ("#rcirc" "#emacs" "#projectm" "#postgresql"))))

;; Don't print /away messages.
(defun rcirc-handler-301 (process cmd sender args)
  "/away message handler.")

(setq rcirc-default-nick "cyber")
(setq rcirc-default-user-name "c")
(setq rcirc-default-full-name "")

;; Connect to servers.
(rcirc); freenode is the default
(rcirc-connect "localhost"); if you run bitlbee, this will connect to it
