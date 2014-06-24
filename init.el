;; (add-to-list 'load-path "~/config/")
;; (load-library "init")

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

;; Resolved by the following steps:
;; 1. download GnuTLS Windows binaries zip from http://www.gnutls.org/download.html
;; 2. extract the zip
;; 3. dump the entire contents of the bin/ folder into C:\Chocolatey\lib\Emacs.24.3\tools\emacs-24.3\bin

;; Install and add git to path

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

; extra recipes for packages unknown to el-get (yet)  
(setq el-get-sources
      '(
	(:name highlight-symbol type: git url: "https://github.com/nschum/highlight-symbol.el.git")
	)
      )

; list all packages you want installed
(setq my-el-get-packages
      (append
       '(highlight-symbol)
       (mapcar 'el-get-source-name el-get-sources)
       )
      )

(el-get 'sync my-el-get-packages) 

; enable packages
(require 'highlight-symbol)
(add-hook 'prog-mode-hook '(lambda () (highlight-symbol-mode t)))

;; solarized theme istalled from package-install
;; (package-initialize)
;; (load-theme 'solarized-light t)
