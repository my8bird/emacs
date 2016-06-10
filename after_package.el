; (load-theme 'gruvbox t)
(load-theme 'darktooth t)

; Always have auto complete running
(global-auto-complete-mode t)
; Start auto-completion after 2 characters of a word
(setq ac-auto-start 2)

;; Set the whitespace rules I must follow
;; - Do this before loading other things encase they cash them
(setq-default py-indent-offset 3)
(setq-default indent-tabs-mode nil)
(setq js-indent-level 3)
(setq-default indent-tabs-mode nil) ; always replace tabs with spaces
(setq-default tab-width 3) ; set tab width to 3 for all buffers
(setq-default c-basic-offset 3)
(setq-default css-indent-offset 3)

(add-hook 'python-mode-hook '(lambda ()
   (setq python-indent 3)
   (flymake-python-pyflakes-load)))

(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

(setq js2-highlight-level 3)


(defun wg/ido-for-this-mode
  ()
  (interactive)
  (let
      ((the-mode major-mode))
    (switch-to-buffer
     (ido-completing-read
      (format "Buffers of %s: " the-mode)
      (save-excursion
	(delq
	 nil
	 (mapcar
	  (lambda
	    (buf)
	    (when
		(buffer-live-p buf)
	      (with-current-buffer buf
		(and
		 (eq major-mode the-mode)
		 (buffer-name buf)))))
	  (buffer-list))))))))

(global-set-key (kbd "H-t") 'wg/ido-for-this-mode)
(global-set-key (kbd "C-c t") 'wg/ido-for-this-mode)

(defun json-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)
    )
  )

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(push "~/.emacs.d/helm-cmd-t" load-path)
(require 'helm-config)

(require 'helm-cmd-t)
(global-set-key (kbd "M-t") 'helm-cmd-t)
;;(setq helm-cmd-t-cache-threshhold
(require 'helm-ls-git)

(require 'helm-grep)
(require 'helm-files)
(require 'helm-locate)

(setq helm-idle-delay 0.1)
(setq helm-input-idle-delay 0.1)
(setq helm-locate-command "es !~ !# %s %s")

; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
; Changed to "C-c h". Note: We must set "C-c h" globally, because we
; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-quick-update                     t ; do not display invisible candidates
      helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-buffers-fuzzy-matching           t ; fuzzy matching buffer names when non--nil
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)
(helm-mode 1)

;(require 'epc)
;(add-hook 'python-mode-hook 'jedi:setup)
;(setq jedi:complete-on-dot t)

(require 'multi-term)

;(elpy-enable)
;(define-key elpy-mode-map (kbd "<C-up>") nil)
;(define-key elpy-mode-map (kbd "<C-down>") nil)
;(define-key elpy-mode-map (kbd "<C-left>") nil)
;(define-key elpy-mode-map (kbd "<C-right>") nil)


(require 'mmm-mode)
(setq mmm-global-mode 'maybe)

(defun my-mmm-markdown-auto-class (lang &optional submode)
  "Define a mmm-mode class for LANG in `markdown-mode' using SUBMODE.
If SUBMODE is not provided, use `LANG-mode' by default."
  (let ((class (intern (concat "markdown-" lang)))
        (submode (or submode (intern (concat lang "-mode"))))
        (front (concat "^```" lang "[\n\r]+"))
        (back "^```"))
    (mmm-add-classes (list (list class :submode submode :front front :back back)))
    (mmm-add-mode-ext-class 'markdown-mode nil class)))

;; Mode names that derive directly from the language name
(mapc 'my-mmm-markdown-auto-class
      '("css" "html" "python" "xml" "sh"))
(my-mmm-markdown-auto-class "javascript" 'js-mode)
