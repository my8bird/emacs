
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
(load "javascript")
(load "sass-mode.el")
(load "haml-mode.el")
(autoload 'python-mode "python-mode" "Python editing mode." t)
(setq-default py-indent-offset 3)
(setq-default indent-tabs-mode nil)

(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))

(setq scroll-bar-mode-explicit t)
(set-scroll-bar-mode `right)

(setq-default show-trailing-whitespace t)

(tool-bar-mode nil)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/mine/ac-dict")
(ac-config-default)

(global-set-key (kbd "C-c b") 'w3m-bookmark-view)
(global-set-key (kbd "C-c w") 'delete-trailing-whitespace)

(fset 'go-to-qt-api
   [?\M-x ?w ?3 ?m ?- ?b ?r ?o tab return ?h ?t ?t ?p ?: ?/ ?/ ?d ?o ?c ?. ?t ?r ?o ?l ?l ?t ?e ?c ?h ?. ?c ?o ?m ?/ ?4 ?. ?5 ?/ ?c ?a ?l backspace backspace ?l ?a ?s ?s ?e ?s ?. ?h ?t ?m ?l return])

(global-set-key (kbd "C-c q") 'go-to-qt-api)

(message "My .emacs loaded in %ds." (destructuring-bind (hi lo ms) (current-time) (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))
