(byte-recompile-directory (expand-file-name "~/.emacs.d/elpa") 0)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
;(add-to-list 'package-archives
;             '("elpy" . "http://jorgenschaefer.github.io/packages/") t)

(package-initialize)

;; - There is no reason for the toolbar
(tool-bar-mode -1)

;; - Show the column count in the mode line
(column-number-mode t)

(setq-default show-trailing-whitespace t)
(global-set-key (kbd "C-c w") 'delete-trailing-whitespace)

;; Auto revert files
(global-auto-revert-mode 1)

;; Don't make backups
(setq make-backup-files -1)
(setq version-control -1)

;; Hide file menu
(menu-bar-mode -1)

(add-hook 'after-init-hook (lambda () (load "~/.emacs.d/after_package.el")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("98a619757483dc6614c266107ab6b19d315f93267e535ec89b7af3d62fb83cad" default)))
 '(package-selected-packages
   (quote
    (mmm-mode markdown-mode+ markdown-mode typescript-mode flymake-python-pyflakes helm-fuzzy-find helm-git-files js2-refactor js2-highlight-vars ac-js2 js2-mode multi-term helm-ls-git helm-cmd-t auto-complete helm darktooth-theme elpy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

