;; When viewing a tab, it appears to be `tab-width` spaces wide.
(setq-default tab-width 4)

;; In text mode...
;;(add-hook 'text-mode-hook
;;          '(lambda ()
	     ;; When inserting tabs, insert spaces instead.
             ;; (setq indent-tabs-mode nil)
	     ;; When highlighting text and hitting tab, indent the lines.
             ;; (setq indent-line-function (quote insert-tab))
;;))


(defcustom tab-shift-width 4
  "Sets selected text shift width on tab"
  :type 'integer)
(make-variable-buffer-local 'tab-shift-width)

;;(require 'general)

(global-set-key
 (kbd "<tab>")
 (lambda (start end)
   (interactive "r")
   (if (use-region-p)
       (save-excursion
     (let ((deactivate-mark nil))
       (indent-rigidly start end tab-shift-width)))
     (indent-for-tab-command))))


(global-set-key
 (kbd "<backtab>")
 (lambda (start end)
   (interactive "r")
   (if (use-region-p)
       (save-excursion
     (let ((deactivate-mark nil))
       (indent-rigidly start end (- tab-shift-width))))
     (indent-for-tab-command))))
