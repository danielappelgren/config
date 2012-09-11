(add-to-list 'load-path "~/danielconf/")
(add-to-list 'load-path "~/danielconf/lib/")
(add-to-list 'load-path "~/github/config/")
(add-to-list 'load-path "~/github/config/lib/")

(require 'fill-column-indicator)

(load-library "setup-el-get.el")

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setenv "LANG" "en_US.UTF8")

(defun dragons()
  (interactive)
  (insert "DRAGONS!!!!!!!!")
  )

(global-set-key [up] 'dragons)
(global-set-key [down] 'dragons)
(global-set-key [left] 'dragons)
(global-set-key [right] 'dragons)

;; Go to next error if available
(global-set-key (kbd "<f4>") 'next-error)
;; Go to previous error if available
(global-set-key (kbd "S-<f4>") 'previous-error)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;; A library that saves the last position in files
(require 'saveplace)
;; Activate it!
(setq-default save-place t)

;; Grep tool goodness
(require 'grep)
;; Alias web that is used to search in all web related files
(add-to-list
 'grep-files-aliases
 '("web" .  "*.js *.css *.html *.htm *.jsp *.xul")
 )

;; Comment or uncomment region
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)

(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-prev)

(defun ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
      (if (< emacs-major-version 22)
          (save-buffers-kill-terminal)
        (save-buffers-kill-emacs))
    (message "Canceled exit")))

(when window-system
  (global-set-key (kbd "C-x C-c") 'ask-before-closing))

;; Show parenthesis near cursor
(show-paren-mode 1)

;; Setup project-root paths and rules
(load-library "setup-project-root.el")

;; Show line number
(global-linum-mode t)

;; IDO!
;; (ido-mode t)

;; Set alias to espresso-mode
(defalias 'js-mode 'espresso-mode)

;; Indentera endast med 4 space för javascript
;; Fixa linje efter x antal columner
;; Kan man på något sätt hoppa till en metod i en fil (utan att söka)?
