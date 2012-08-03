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

(el-get 'sync)

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
   (:name redo+ :type elpa
          :after (lambda ()
                   ;; Better undo / redo handling
                   (require 'redo+)
                   (global-set-key  [?\M-_] 'redo)))

   ;; Javascript mode
   (:name js2-mode :type git :url "https://github.com/mooz/js2-mode.git" :module "js2-mode")

   ;; Highlight using F3 or C-F3
   (:name highlight-symbol :type http :url "http://nschum.de/src/emacs/highlight-symbol/highlight-symbol.el")

   (:name auto-complete :type git :url "https://github.com/m2ym/auto-complete/etc/install.el")

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
   )
 )

;; ;; Append the package lists
(setq my:el-get-packages
      (append
       my:el-get-packages
       (loop for src in el-get-sources collect (el-get-source-name src))))

(el-get 'sync my:el-get-packages)
