;; make C-x C-f pull up project-find-file instead of find-file
;;(project-find-file C-f)
;; So it turns out I can do C-x p f to pull up project-find-file
;; works!:
;;(global-unset-key (kbd "C-x C-f"))
;;(global-set-key (kbd "C-x C-f") 'project-find-file)
;; alternative approach
(define-key (current-global-map) [remap find-file] 'project-find-file)

;; (global-set-key (kbd "M-<left>")  'windmove-left) this code is commented it out. we can delete it soon

;; This is great except that I can't get it to work with 'meta (alt). It works great with shift, but then I can't use shift to select multiple lines of code.
(windmove-default-keybindings 'meta)

