; ctl-c, d = open dash
(global-set-key "\C-cd" 'dash-at-point)
; M-. = elpy go to definition
(define-key elpy-mode-map (kbd "M-.") 'goto-def-or-rgrep)
; M-, = rgrep
(define-key elpy-mode-map (kbd "M-,") 'elpy-rgrep-symbol)
; M-S-, = project-find-regexp
(define-key elpy-mode-map (kbd "C-,") 'project-find-regexp)

; ctl-` = jump back to last term or make a new one
(global-set-key (kbd "C-`") 'get-term)
; M-` = toggle dedicated term
(global-set-key (kbd "M-`") 'multi-term-dedicated-toggle)
; f1 = new terminal
(global-set-key [f1] 'multi-term)
; M-e, M-r = cycle between terminals
(global-set-key "\M-a" 'multi-term-prev)
(global-set-key "\M-s" 'multi-term-next)
; C-q = quick switch buffer, M-q go backwards
(global-set-key "\C-q" 'bubble-buffer-next)
(global-set-key "\M-q" 'bubble-buffer-previous)
(add-hook 'term-mode-hook (lambda ()
  (define-key term-raw-map (kbd "C-y") 'term-paste)))

; ctl-t = pytest current module
(global-set-key "\C-t" 'pytest-module)
; editing
(global-set-key "\M-1" 'copy-region-as-kill) ; Copy
(global-set-key "\M-2" 'kill-region)         ; Cut
(global-set-key "\M-3" 'yank)                ; Paste 
(global-set-key "\M-z" 'undo)           ; [Undo] 
(global-set-key [insert]    'overwrite-mode)   ; [Ins]
(global-set-key [kp-insert] 'overwrite-mode)   ; [Ins] 
(global-set-key "\C-l" 'goto-line)             ; goto-line
(global-set-key "\C-f" 'recenter)              ; recenter
(global-set-key [f2] 'split-window-vertically)
(global-set-key "\C-m" 'newline-and-indent)

; M-/ comment-region
(global-set-key "\M-;" 'comment-dwim)

; menu bar
(global-set-key "\M-'" 'menu-bar-open)

; use ijkl as arrow keys
(global-set-key "\M-i" 'previous-line)
(global-set-key "\M-k" 'next-line) 
(global-set-key "\M-j" 'backward-char) 
(global-set-key "\M-l" 'forward-char) 
; M-U, M-O prev/next word
(global-set-key "\M-u" 'hyphy-backward-word)
(global-set-key "\M-o" 'hyphy-forward-word)
; M-H delete back, M-; delete char
(global-set-key "\M-h" 'backward-delete-char-untabify)
;(global-set-key "\M-;" 'delete-char)
; C-U, C-J page up/down
(global-set-key "\C-u" 'scroll-down)
(global-set-key "\C-j" 'scroll-up)
; C-H delete word backwards
(global-set-key "\C-h" 'backward-kill-word)
; CS-d duplicate line
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key (kbd "C-S-d") 'duplicate-line)
