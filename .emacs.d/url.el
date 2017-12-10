(require 'url)

; synchronously    
(defun get-url (url)
  (with-current-buffer (url-retrieve-synchronously url) (buffer-string)))
