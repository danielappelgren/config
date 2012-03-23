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


