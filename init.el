(add-to-list 'load-path "~/danielconf/")
(add-to-list 'load-path "~/danielconf/lib/")

(add-to-list 'load-path "~/github/config/lib/")
(require 'fill-column-indicator)
(load-library "setup-el-get.el")

(defun dragons()
  (interactive)
  (insert "DRAGONS!!!!!!!!")
  )

(global-set-key [up] 'dragons)
(global-set-key [down] 'dragons)
(global-set-key [left] 'dragons)
(global-set-key [right] 'dragons)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

(setq fci-rule-width 1)
(setq fci-rule-color "darkblue")
(setq fci-rule-column 80)
(add-hook 'javascript-mode-hook 'fci-mode)

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Indentera endast med 4 space för javascript
;; Fixa linje efter x antal columner
;; Någon slags auto-komplettering
;; Javascript tomma rader skall innehålla exakt 8 mellanslag (verifiera med jslint innan)
;; Kan man på något sätt hoppa till en metod i en fil (utan att söka)?
;; Få lite koll på encoding.
;; När man markerar en { skulle det vara trevligt om den stängande } kunde markeras samtidigt
