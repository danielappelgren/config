;; Set up ELPA to have more repositories!
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("SC"   . "http://joseito.republika.pl/sunrise-commander/")
                         )
      )

(require 'cl)				; common lisp goodies, loop

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (goto-char (point-max))
     (eval-print-last-sexp))))

;; set local recipes
(setq
 el-get-sources
 '(
   ;; Easier moving buffers
   (:name buffer-move ; have to add your own keys
          :after (lambda ()
                   (global-set-key (kbd "<C-S-up>")     'buf-move-up)
                   (global-set-key (kbd "<C-S-down>")   'buf-move-down)
                   (global-set-key (kbd "<C-S-left>")   'buf-move-left)
                   (global-set-key (kbd "<C-S-right>")  'buf-move-right)))

   ;; Better M-X
   (:name smex
          :after (lambda ()
                   (setq smex-save-file "~/.emacs.d/.smex-items")
                   (global-set-key (kbd "M-x") 'smex)
                   (global-set-key (kbd "M-X") 'smex-major-mode-commands)))

   ;; Redo
   (:name redo+ :type git
          :url "https://github.com/emacsmirror/redo-plus.git"
          :after (lambda ()
                   ;; Better undo / redo handling
                   (require 'redo+)
                   (global-set-key  [?\M-_] 'redo)))


   ;; Javascript mode
   (:name js2-mode :type git :url "https://github.com/mooz/js2-mode.git" :module "js2-mode")

   ;; Highlight using F3 or C-F3
   (:name highlight-symbol :type http :url "http://nschum.de/src/emacs/highlight-symbol/highlight-symbol.el")

   (:name auto-complete :type git :url "https://github.com/YorkZ/auto-complete.git" :depends popup :load-path "."
          :post-init (lambda ()
                       (require 'auto-complete)
                       (add-to-list 'ac-dictionary-directories (expand-file-name "dict" pdir))
                       (require 'auto-complete-config)
                       (ac-config-default)))

   (:name project-root :type http-tar :module "project-root" :options ("xzf") :url "http://hg.piranha.org.ua/project-root/archive/tip.tar.gz"
          :after (lambda ()
                   (require 'project-root)
                   (global-set-key (kbd "<C-f7>") (lambda ()
                                                    (interactive)
                                                    (project-root-configure)
                                                    ))
                   (global-set-key (kbd "<S-f7>") (lambda ()
                                                    (interactive)
                                                    (project-root-clean)
                                                    ))
                   (global-set-key (kbd "<f7>") (lambda ()
                                                  (interactive)
                                                  (project-root-compile)
                                                  ))
                   (global-set-key (kbd "<f8>") (lambda ()
                                                  (interactive)
                                                  (project-root-clean-compile-dev)
                                                  ))
                   (global-set-key (kbd "<f5>") (lambda ()
                                                  (interactive)
                                                  (project-root-run)
                                                  ))
                   (global-set-key (kbd "<C-f5>") (lambda ()
                                                    (interactive)
                                                    (project-root-debug)
                                                    ))
                   )
          )
   
   )
 )

 ;; now set our own packages
 (setq
  my:el-get-packages
  '(el-get				; el-get is self-hosting
    js2-mode
    redo+
    smex
    buffer-move
    highlight-symbol
    auto-complete
    project-root
    ))

 ;; Append the package lists
 (setq my:el-get-packages
       (append
        my:el-get-packages
        (loop for src in el-get-sources collect (el-get-source-name src))))

 (el-get 'sync my:el-get-packages)
