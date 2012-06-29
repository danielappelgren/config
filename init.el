(add-to-list 'load-path "~/danielconf/")
(add-to-list 'load-path "~/danielconf/lib/")
(add-to-list 'load-path "~/github/config/")
(add-to-list 'load-path "~/github/config/lib/")

(require 'fill-column-indicator)

(load-library "setup-el-get.el")

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

(require 'highlight-symbol)

(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-prev)

;; Indentera endast med 4 space f�r javascript
;; Fixa linje efter x antal columner
;; N�gon slags auto-komplettering
;; Javascript tomma rader skall inneh�lla exakt 8 mellanslag (verifiera med jslint innan)
;; Kan man p� n�got s�tt hoppa till en metod i en fil (utan att s�ka)?
;; F� lite koll p� encoding.
;; N�r man markerar en { skulle det vara trevligt om den st�ngande } kunde markeras samtidigt
