;; When viewing a tab, it appears to be `tab-width` spaces wide.
(setq-default tab-width 4)

;; In text mode...
(add-hook 'text-mode-hook
          '(lambda ()
	     ;; When inserting tabs, insert spaces instead.
             ;; (setq indent-tabs-mode nil)
	     ;; When highlighting text and hitting tab, indent the lines.
             (setq indent-line-function (quote insert-tab))
))

;; If you need nice indenting, unindenting, use C-x TAB followed by left, right, S-left, S-right.
