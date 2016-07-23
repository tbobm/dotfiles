;; Theo Massard ;;

;; add MELPA repository ;;
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;; dockerfile mode with syntax ;;
(add-to-list 'load-path "/root/.emacs.d/dockerfile-mode")
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; neotree, [f8] to see current directory branch ;;
(add-to-list 'load-path "/root/.emacs.d/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; powerline ;;
(add-to-list 'load-path "/root/.emacs.d/powerline")
(require 'powerline)
(powerline-default-theme)

;; moe-theme ;;
(add-to-list 'custom-theme-load-path "~/.emacs.d/moe-theme.el/")
(add-to-list 'load-path "/root/.emacs.d/moe-theme")
(require 'moe-theme)
(load-theme 'moe-dark t)
(moe-dark)
(moe-theme-set-color 'blue)

;; autocomplete config ;;
(require 'auto-complete-config)
;; C-n and C-p allows to easily switch between choices ;;
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
(ac-config-default)

;; latex config ;;
(require 'ac-math)
(add-to-list 'ac-modes 'latex-mode) ; make autocomplete aware of latex-mode

(defun ac-LaTeX-mode-setup ()
  (setq ac-sources
	(append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
		ac-sources))
    )
(add-hook 'LaTeX-mode-hook 'ac-LaTeX-mode-setup)
(global-auto-complete-mode t)
(setq ac-math-unicode-in-math-p t)

;; go-mode ;;
(require 'go-mode-autoloads)

;; yasnippet ;;
(yas-global-mode 1)

;; saveplace puts the cursos back to its ;;
;; place after closing/opening a file ;;
(require 'saveplace)
(setq-default save-place t)

;; show file name with [f7] ;;
(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name)))
(global-set-key [f7] 'show-file-name)

;; custom settings ;;
(global-linum-mode) ; adds line numbers on the left
(global-visual-line-mode t) ; add word-wrap
(setq column-number-mode t) ; show the column number on the powerline (bot-right)
(show-paren-mode 1) ; highlights matching [] () 
(electric-pair-mode 1) ; creates pairs when working typing '[' or '('
