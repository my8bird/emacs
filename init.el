
;;;; Nate's .emacs file


(defvar emacs-root (concat (getenv "HOME") "/.emacs.d/"))

(defun add-path (p)
  (add-to-list 'load-path (concat emacs-root p)))

(defvar *emacs-load-start* (current-time))

(add-path "mine")
(load "dependencies.el")
(load "customizations.el")
(load "ruby.el")
(load "ecb.el")
(load "erlang.el")
;;(load "javascript")
;;(autoload 'js2-mode "js2-mode" nil t)
;;(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(load "sass-mode.el")
(load "haml-mode.el")
(autoload 'python-mode "python-mode" "Python editing mode." t)
(setq-default py-indent-offset 3)
(setq-default indent-tabs-mode nil)
(setq js-indent-level 3)

;;(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))

(setq scroll-bar-mode-explicit t)
(set-scroll-bar-mode `right)

(setq-default show-trailing-whitespace t)

(tool-bar-mode nil)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/mine/ac-dict")
(ac-config-default)

(global-set-key (kbd "C-c w") 'delete-trailing-whitespace)

;; Me likey column count
(column-number-mode t)

(setq-default indent-tabs-mode nil) ; always replace tabs with spaces
(setq-default tab-width 3) ; set tab width to 3 for all buffers
(setq-default c-basic-offset 3)

(message "My .emacs loaded in %ds." (destructuring-bind (hi lo ms) (current-time) (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))
