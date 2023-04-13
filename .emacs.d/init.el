
;; This is great except that I can't get it to work with 'meta (alt). It works great with shift, but then I can't use shift to select multiple lines of code.
(windmove-default-keybindings 'meta)

;; (global-set-key (kbd "M-<left>")  'windmove-left) this code is commented it out. we can delete it soon

;; This means that emacs will remember which windows you had open when it was launched from a particular directory. Therefore the directory from which you launch emacs determines the emacs session.
(desktop-save-mode 1)
