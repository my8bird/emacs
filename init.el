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
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))
(load "haml-mode.el")
(autoload 'python-mode "python-mode" "Python editing mode." t)

(setq-default py-indent-offset 3)
(setq-default indent-tabs-mode nil)
(setq js-indent-level 3)
(setq-default indent-tabs-mode nil) ; always replace tabs with spaces
(setq-default tab-width 3) ; set tab width to 3 for all buffers
(setq-default c-basic-offset 3)

;;https://github.com/defunkt/coffee-mode
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))

;;(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))

(setq scroll-bar-mode-explicit t)
(set-scroll-bar-mode `right)

(setq-default show-trailing-whitespace t)

(tool-bar-mode nil)
(setq imenu-auto-rescan 1)


(defun flymake-create-temp-intemp (file-name prefix)
  (unless (stringp file-name)
    (error "Invalid file-name"))
  (or prefix
      (setq prefix "flymake"))
  (let* ((name (concat
                (file-name-nondirectory
                 (file-name-sans-extension file-name))
                "_" prefix))
         (ext  (concat "." (file-name-extension file-name)))
         (temp-name (make-temp-file name nil ext))
         )
    (flymake-log 3 "create-temp-intemp: file=%s temp=%s" file-name temp-name)
    temp-name))

(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-intemp))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))

(add-hook 'find-file-hook 'flymake-find-file-hook)


;; Syntax highlighting in python files
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))

(add-hook 'find-file-hook 'flymake-find-file-hook)

;; Enable Spell checking on some files
(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'python-mode-hook 'flyspell-prog-mode)
(add-hook 'coffee-mode-hook 'flyspell-prog-mode)
(add-hook 'javascript-mode-hook 'flyspell-prog-mode)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/mine/ac-dict")
(ac-config-default)

(global-set-key (kbd "C-c w") 'delete-trailing-whitespace)

;; Me likey column count
(column-number-mode t)

(message "My .emacs loaded in %ds." (destructuring-bind (hi lo ms) (current-time) (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))
