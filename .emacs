(package-initialize)
(server-start)

; more config files live in...
(defconst config-dir "~/.emacs.d")
(defun load-config (file)
  (load (concat config-dir "/" file)))

; MELPA packages
(load-config "melpa")
; curl stuff
(load-config "url")
; python dev stuff
(load-config "python")
; save session automatically
(load-config "desktop")
; bubble buffer quick switching
(load-config "bubblebuffer")
; jump word
(load-config "wordjump")
; terminal
(load-config "term")
; sweet key bindings
(load-config "keybindings")

; fix annoying stuff
;;;; auto-save files
(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
`((".*" ,temporary-file-directory t)))
; (setq make-backup-files nil)
; (setq auto-save-list-file-name   nil) ; Don't want any .saves files
(setq inhibit-startup-message    t)   ; Don't want any startup message
(setq search-highlight           t)   ; Highlight search object
(setq query-replace-highlight    t)   ; Highlight query object
(setq mouse-sel-retain-highlight t)   ; Keep mouse high-lighting
(set-display-table-slot standard-display-table 'wrap ?\ ) ; Removes backslash when line wraps over

; display/editing stuff
(setq-default default-indicate-empty-lines t)
(setq-default indent-tabs-mode nil)
(global-font-lock-mode t)
(transient-mark-mode t)
(column-number-mode t)
(setq-default show-trailing-whitespace nil) ; no trailing whitespace display

(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer
          (delq (current-buffer) 
                (remove-if-not 'buffer-file-name (buffer-list)))))

(defun mischa/delete-word (arg)
  "Delete characters forward until encountering the end of a word.
With argument ARG, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point))))
(defun mischa/backward-delete-word (arg)
  "Like `backward-kill-word', but doesn't modify the kill ring."
  (interactive "p")
  (mischa/delete-word (- arg)))
(global-set-key (kbd "M-<backspace>") #'mischa/backward-delete-word)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes (quote (wheatgrass)))
 '(flycheck-flake8-maximum-line-length 200)
 '(package-selected-packages
   (quote
    (multi-term fetch elpy pytest git flycheck flymake-python-pyflakes virtualenvwrapper darkburn-theme darktooth-theme dash-at-point)))
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(tool-bar-style (quote text)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "wheat" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "Menlo")))))
