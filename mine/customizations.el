;; Key Bindings
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-x\C-j" 'speedbar)
(global-set-key "\r" 'newline-and-indent)

(global-unset-key "\C-z")

;; Setup Environmental Variables
(setq default-major-mode 'text-mode)
(setq inhibit-startup-message t)
(setq custom-file (concat emacs-root "/mine/customizations.el"))

;; Auto revert files
(global-auto-revert-mode 1)

;; Don't make backups
(setq make-backup-files nil)
(setq version-control nil)

;; Look Pretty
(global-hl-line-mode 1)

;; Miscallaneous Things
(mouse-wheel-mode t)
(setq visible-bell t)
;; (setq-default show-trailing-whitespace t)
(put 'downcase-region 'disabled nil)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-auto-activate t)
 '(ecb-options-version "2.32")
 '(ecb-source-path (quote ("~/code/learning/bank" "~/code")))
 '(ecb-wget-setup (quote cons))
 '(mumamo-background-chunk-major (quote default))
 '(mumamo-set-major-mode-delay 0.1)
 '(paren-match-face (quote paren-face-match-light))
 '(paren-sexp-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) (:background "midnight blue"))))
 '(mumamo-background-chunk-submode ((t nil))))
