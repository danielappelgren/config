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
		 multiple-cursors)
       (mapcar 'el-get-source-name el-get-sources)
       )
      )

(el-get 'sync my-el-get-packages) 

;; enable packages
(require 'highlight-symbol)
(require 'multiple-cursors)
(add-hook 'prog-mode-hook '(lambda () (highlight-symbol-mode t)))
										; Multiple cursors conf
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; solarized theme istalled from package-install
;; (package-initialize)
;; (load-theme 'solarized-light t)
