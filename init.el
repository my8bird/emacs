(defvar emacs-root (concat (getenv "HOME") "/.emacs.d/"))

(defun add-path (p)
  (add-to-list 'load-path (concat emacs-root p)))

(defvar *emacs-load-start* (current-time))


;; Add the packages I care about
;; -JavaScript
(add-path "js2-mode")
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; CoffeeScript
(add-path "coffee-mode")
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))

;; SCSS
(add-path "scss-mode")
(require 'scss-mode)
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))

;; Easier File Finder (C-x C-f)
(require 'ido)
(ido-mode t)


;; Set the whitespace runs I must follow
(setq-default py-indent-offset 3)
(setq-default indent-tabs-mode nil)
(setq js-indent-level 3)
(setq-default indent-tabs-mode nil) ; always replace tabs with spaces
(setq-default tab-width 3) ; set tab width to 3 for all buffers
(setq-default c-basic-offset 3)


;; Setup the UI the way i like it
;; - move the scrollbars
(setq scroll-bar-mode-explicit t)
(set-scroll-bar-mode `right)

;; - Tell me when I make stupid whitespaces
(setq-default show-trailing-whitespace t)
;; - Provide a simple way to fix white space
(global-set-key (kbd "C-c w") 'delete-trailing-whitespace)

;; - There is no reason for the toolbar
(tool-bar-mode nil)

;; - Keep the menus upto date.
(setq imenu-auto-rescan 1)

;; - Show the column count in the mode line
(column-number-mode t)


;; Key Bindings
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\r" 'newline-and-indent)

;; Auto revert files
(global-auto-revert-mode 1)

;; Don't make backups
(setq make-backup-files nil)
(setq version-control nil)


