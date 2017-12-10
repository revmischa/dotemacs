; flake8
(add-hook 'after-init-hook #'global-flycheck-mode)

;(require 'flymake-python-pyflakes)
;(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
;(setq flymake-python-pyflakes-executable "flake8")

; tests
(require 'pytest)

; venv
(venv-workon "jb")

; use ipython
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i")

(defun goto-def-or-rgrep ()
  "Go to definition of thing at point or do an rgrep in project if that fails"
  (interactive)
  (condition-case nil (elpy-goto-definition)
    (error (elpy-rgrep-symbol (thing-at-point 'symbol)))))

(remove-hook 'elpy-modules 'elpy-module-flymake)
(elpy-enable)
