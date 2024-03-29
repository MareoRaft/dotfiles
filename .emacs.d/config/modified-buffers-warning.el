;; Suppress the modified buffers warning.
;;
;; When emacs asks you if you want to save a file and you say no, if the file buffer has changes, emacs will warn you "Modified buffers exist; exit anyway? (yes or no)". This can be seen as annoying given that you just said no to saving the file. The following code overwrites the save-buffers-kill-emacs function with a custom version in order to disable that warning.
;; ref: https://stackoverflow.com/questions/6762686/prevent-emacs-from-asking-modified-buffers-exist-exit-anyway

;; Define the custom version of the function.
(defun my-save-buffers-kill-emacs (&optional arg)
  "Offer to save each buffer(once only), then kill this Emacs process.
With prefix ARG, silently save all file-visiting buffers, then kill."
  (interactive "P")
  (save-some-buffers arg t)
  (and (or (not (fboundp 'process-list))
       ;; process-list is not defined on MSDOS.
       (let ((processes (process-list))
         active)
         (while processes
           (and (memq (process-status (car processes)) '(run stop open listen))
            (process-query-on-exit-flag (car processes))
            (setq active t))
           (setq processes (cdr processes)))
         (or (not active)
         (progn (list-processes t)
            (yes-or-no-p "Active processes exist; kill them and exit anyway? ")))))
       ;; Query the user for other things, perhaps.
       (run-hook-with-args-until-failure 'kill-emacs-query-functions)
       (or (null confirm-kill-emacs)
       (funcall confirm-kill-emacs "Really exit Emacs? "))
       (kill-emacs)))

;; Overwrite the existing function with the custom one.
(fset 'save-buffers-kill-emacs 'my-save-buffers-kill-emacs)
