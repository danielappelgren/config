
;; First things firts, load el-get packages
(load-library "setup-el-get.el")

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(defun dragons()
  (interactive)
  (insert "DRAGONS!!!!!!!!")
  )
(global-set-key [up] 'dragons)
(global-set-key [down] 'dragons)
(global-set-key [left] 'dragons)
(global-set-key [right] 'dragons)

;; Overwrite selection when pasting / yanking!
(delete-selection-mode 1)

;; make searches case insensitive
(setq case-fold-search t)

;; Use y-n instead of yes-no
(fset 'yes-or-no-p 'y-or-n-p)

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
	(if (region-active-p)
		(setq beg (region-beginning) end (region-end))
	  (setq beg (line-beginning-position) end (line-end-position)))
	(comment-or-uncomment-region beg end)))
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region-or-line)

;; Java specefic stuff
(defun java-shortcuts ()
  (local-set-key (kbd "C-c C-c") 'comment-or-uncomment-region-or-line))
(add-hook 'java-mode-hook 'java-shortcuts)

;; HTML specefic stuff
(defun html-shortcuts ()
  (local-set-key (kbd "C-c C-c") 'comment-or-uncomment-region-or-line))
(add-hook 'html-mode-hook 'html-shortcuts)


;; Show line and column number in the mode line
(line-number-mode 1)
(column-number-mode 1)
;; Show line number
(global-linum-mode t)

(setq-default tab-width 4)

;; Remove toolbar icons
(tool-bar-mode -1)

;; Suppress GNU startup message
(setq inhibit-startup-message t)

;; Show the name of the file being edited in the title bar
(setq frame-title-format '("%b" (buffer-file-name ": %f")) )

;; Show parenthesis near cursor
(show-paren-mode 1)

;; Disable beeping
(setq visible-bell t)

;; A library that saves the last position in files
(require 'saveplace)
;; Activate it!
(setq-default save-place t)

;; Backup files handling
(defvar --backup-directory (concat user-emacs-directory "backups"))
(if (not (file-exists-p --backup-directory))
        (make-directory --backup-directory t))
(setq backup-directory-alist `(("." . ,--backup-directory)))
(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )
