;; el-get stuff
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;; extra recipes for packages unknown to el-get (yet)  
(setq el-get-sources
      '(
	(:name highlight-symbol type: git url: "https://github.com/nschum/highlight-symbol.el.git")
	)
      )


;; list all packages you want installed
(setq my-el-get-packages
      (append
       '(highlight-symbol
		 multiple-cursors
		 auto-complete
		 color-theme)
       (mapcar 'el-get-source-name el-get-sources)
       )
      )

;; install new packages and init already installed packages
(el-get 'sync my-el-get-packages)

;; enable packages
(require 'highlight-symbol)
(require 'multiple-cursors)
(require 'auto-complete)

(add-hook 'prog-mode-hook '(lambda () (highlight-symbol-mode t)))

; Multiple cursors conf
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Auto complete config
;; Fix navigation
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
;; dirty fix for having autocomplete everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
						   (auto-complete-mode 1))
                       ))
(real-global-auto-complete-mode t)

;; Color Theme
(color-theme-initialize)
(color-theme-rotor)
(set-face-attribute 'highlight nil :foreground 'unspecified)
(set-face-attribute 'highlight nil :background 'unspecified)
(set-face-foreground 'highlight nil)
(set-face-underline-p 'highlight t)
