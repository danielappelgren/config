(add-to-list 'load-path "~/github/config/lib/")
(require 'fill-column-indicator)

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

;; Indentera endast med 4 space f�r javascript
;; Fixa linje efter x antal columner
;; N�gon slags auto-komplettering
;; Javascript tomma rader skall inneh�lla exakt 8 mellanslag (verifiera med jslint innan)
;; Kan man p� n�got s�tt hoppa till en metod i en fil (utan att s�ka)?
;; F� lite koll p� encoding.
;; N�r man markerar en { skulle det vara trevligt om den st�ngande } kunde markeras samtidigt