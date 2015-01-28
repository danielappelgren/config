;; JDEE
(setq jde-help-remote-file-exists-function '("beanshell"))
(require 'cedet)
(add-to-list 'load-path "~/.emacs.d/jdee-2.4.1/lisp")
(load "jde")
(load "jde-autoload")

(defun java-my-minor ()
  (progn
	(gtags-mode t)
	;; (auto-complete-mode t)
	(add-to-list 'ac-sources ac-source-gtags)
	(add-hook 'before-save-hook
			  (lambda ()
				(jde-import-kill-extra-imports)
				(jde-import-all)
				(jde-import-organize))
			  nil t)
	(add-hook 'after-save-hook 'jde-compile nil t)))
(add-hook 'jde-mode-hook 'java-my-minor)

;; Must name the jde-jdk registry to 1.6 to make it work.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(jde-jdk (quote ("1.6")))
 '(jde-jdk-registry (quote (("1.6" . "/Library/Java/JavaVirtualMachines/jdk1.8.0_20.jdk/Contents/Home")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
