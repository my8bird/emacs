(defvar emacs-root (concat (getenv "HOME") "/.emacs.d/"))

(defun add-path (p)
  (add-to-list 'load-path (concat emacs-root p)))

(defvar *emacs-load-start* (current-time))

;; Set the whitespace rules I must follow
;; - Do this before loading other things encase they cash them
(setq-default py-indent-offset 3)
(setq-default indent-tabs-mode nil)
(setq js-indent-level 3)
(setq-default indent-tabs-mode nil) ; always replace tabs with spaces
(setq-default tab-width 3) ; set tab width to 3 for all buffers
(setq-default c-basic-offset 3)

(add-hook 'python-mode-hook '(lambda ()
   (setq python-indent 3)))

;; Setup theming
(add-path "color-theme")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-charcoal-black)))


;; Spell checking
(add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
(setq ispell-program-name "aspell")
(require 'ispell)

;; SmartTab
;;(add-path "smart-tab")
;;(require 'smart-tab)

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
(setq scss-compile-at-save nil)
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))
(setq scss-compile-at-save nil)

;; Python
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pyflakes"  (list temp-file))))

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))

(add-hook 'python-mode-hook 'flymake-mode)

;; Enable spell check
;;(mapcar (lambda (mode-hook) (add-hook mode-hook 'flyspell-prog-mode))
;;        '(python-mode-hook))


;; Handlebars
;;(add-path "handlebars-mode")
;;(require 'handlebars-mode)
;;(add-to-list 'auto-mode-alist '("\\.handlebar$" . handlebars-mode))

;; Markdown editing
;;(add-path "markdown-mode")
;;(require 'markdown-mode)
;;(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; - Tell me when I make stupid whitespaces
(setq-default show-trailing-whitespace t)
;; - Provide a simple way to fix white space
(global-set-key (kbd "C-c w") 'delete-trailing-whitespace)

;; Setup the UI the way i like it
;; - move the scrollbars
(setq scroll-bar-mode-explicit t)
(set-scroll-bar-mode `right)

;; - There is no reason for the toolbar
(tool-bar-mode -1)

;; - Why would I want to see the splash screen
(setq inhibit-splash-screen t)

;; - Keep the menus upto date.
(setq imenu-auto-rescan 1)

;; - Show the column count in the mode line
(column-number-mode t)

;; Key Bindings
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\r" 'newline-and-indent)

;; Easier File Finder (C-x C-f)
(require 'ido)
(ido-mode t)
(setq ido-max-directory-size 100000)

;; Auto revert files
(global-auto-revert-mode 1)

;; Don't make backups
(setq make-backup-files -1)
(setq version-control -1)

;; Set the whitespace rules I must follow
;; - Do this before loading other things encase they cash them
(setq py-indent-offset 3)
(setq indent-tabs-mode nil)
(setq js-indent-level 3)
(setq indent-tabs-mode nil) ; always replace tabs with spaces
(setq tab-width 3) ; set tab width to 3 for all buffers
(setq c-basic-offset 3)
