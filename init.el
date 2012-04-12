(add-to-list 'load-path "~/danielconf/")
(add-to-list 'load-path "~/danielconf/lib/")
(add-to-list 'load-path "~/github/config/")
(add-to-list 'load-path "~/github/config/lib/")

(require 'fill-column-indicator)

(load-library "setup-el-get.el")
el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get") (unless (require 'el-get nil t) (url-retrieve "https://raw.github.com/dimitri/el-get/master/el-get-install.el" (lambda (s) (end-of-buffer) (eval-print-last-sexp))))
(add-to-list 'load-path "~/.emacs.d/el-get/el-get") (unless (require 'el-get nil t) (with-current-buffer (url-retrieve-synchronously "https://raw.github.com/dimitri/el-get/master/el-get-install.el") (end-of-buffer) (eval-print-last-sexp))) (el-get 'sync)

; try to improve slow performance on windows.
;; (setq w32-get-true-file-attributes nil)

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

;; (setq fci-rule-width 1)
;; (setq fci-rule-color "darkblue")
;; (setq fci-rule-column 80)
;; (add-hook 'javascript-mode-hook 'fci-mode)

;; Indentera endast med 4 space för javascript
;; Fixa linje efter x antal columner
;; Någon slags auto-komplettering
;; Javascript tomma rader skall innehålla exakt 8 mellanslag (verifiera med jslint innan)
;; Kan man på något sätt hoppa till en metod i en fil (utan att söka)?
;; Få lite koll på encoding.
;; När man markerar en { skulle det vara trevligt om den stängande } kunde markeras samtidigt
