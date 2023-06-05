;; When viewing a tab, it appears to be `tab-width` spaces wide.
(setq-default tab-width 4)

;; ;; TEMP DISABLE THIS so we can try out GUESS STYLE, which is a more complete solution, even though this WORKS
;; Use spaces instead of tabs.
;; (if user asks to indent to position 7, for example, do not insert a tab followed by 3 spaces, but rather insert all spaces)
;; (setq-default indent-tabs-mode nil)

;; ;; TEMP DISABLE THIS so we can try out GUESS STYLE, which is a more complete solution, even though this WORKS
;; (defun infer-indentation-style ()
;;   ;; if our source file uses tabs, we use tabs, if spaces spaces, and if        
;;   ;; neither, we use the current indent-tabs-mode                               
;;   (let ((space-count (how-many "^  " (point-min) (point-max)))
;;         (tab-count (how-many "^\t" (point-min) (point-max))))
;;     (if (> space-count tab-count) (setq indent-tabs-mode nil))
;;     (if (> tab-count space-count) (setq indent-tabs-mode t))))
;; ;; Infer whether to use tabs or spaces based on what the file already uses
;; (infer-indentation-style)



;; ;; In text mode...
;; (add-hook 'text-mode-hook
;;     '(lambda ()
;; 	    ;; When highlighting text and hitting tab, indent the lines.
;;         (setq indent-line-function (quote insert-tab))
;; 		)
;; )


;; (defcustom tab-shift-width 4
;;   "Sets selected text shift width on tab"
;;   :type 'integer)
;; (make-variable-buffer-local 'tab-shift-width)

;; ;;(require 'general)

;; THIS DOES NOT WORK.  DELETE IT SOON.
;; (global-set-key
;;  (kbd "<tab>")
;;  (lambda (start end)
;;    (interactive "r")
;;    (if (use-region-p)
;;        (save-excursion
;;      (let ((deactivate-mark nil))
;;        (indent-rigidly start end tab-shift-width)))
;;      (indent-for-tab-command))))

;; THIS WORKS. LEAVE IT BE unless you find a tool that replaces both this and <tab> in one go.
(global-set-key
 (kbd "<backtab>")
 (lambda (start end)
   (interactive "r")
   (if (use-region-p)
       (save-excursion
     (let ((deactivate-mark nil))
       (indent-rigidly start end (- 4))))
     (indent-for-tab-command))))
