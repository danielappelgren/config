(setq project-roots
      '(
        ("Maven project"
         :root-contains-files ("pom.xml")
         :on-hit (lambda (p)
                   ;; Compile
                   (defun project-root-compile()
                     (interactive)
                     (with-project-root 
                         (compile (concat "cd " default-directory " && mvn compile"))
                         )
                     )
                   ;; Clean
                   (defun project-root-clean()
                     (interactive)
                     (with-project-root 
                         (compile (concat "cd " default-directory " && mvn clean"))
                         )
                     )
                   ;; Clean compile with profile dev
                   (defun project-root-clean-compile-dev()
                     (interactive)
                     (with-project-root 
                         (compile (concat "cd " default-directory " && mvn clean -U compile -P dev"))
                         )
                     )

                   )
         )
        )
      )


(defun ido-project-root-find-file ()
  "Use ido to select a file from the project."
  (interactive)
  (let (my-project-root project-files tbl)
    (unless project-details (project-root-fetch))
    (setq my-project-root (cdr project-details))
    (let ((command (concat "cd "
                           my-project-root
                           " && "
                           project-root-find-files-command)))
      ;;(message command)
      (setq project-files
            (split-string
             (shell-command-to-string command) "\n")))

    ;; populate hash table (display repr => path)
    (setq tbl (make-hash-table :test 'equal))
    (let (ido-list)
      (mapc (lambda (path)
              ;; format path for display in ido list
              (setq key path)
              ;; strip project root
              (setq key (replace-regexp-in-string my-project-root "" key))
              ;; remove trailing | or /
              (setq key (replace-regexp-in-string "\\(|\\|/\\)$" "" key))
              (puthash key path tbl)
              (push key ido-list)
              )
            project-files
            )
      (find-file (gethash (ido-completing-read "project-files: " ido-list) tbl)))))

(global-set-key "" (quote ido-project-root-find-file))