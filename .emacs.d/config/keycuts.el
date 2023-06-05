;; key bindings
;(when (eq system-type 'darwin) ;; Mac-specific settings
;; none of the below two lines appear to work
  (setq mac-command-modifier 'alt) ;; Set left Mac command key to map to the emacs "super" modifier key, which is then denoted by "s-" in keyboard shortcuts.
  (setq mac-right-command-modifier 'alt)
;)

;; more modern-text-editor-standard behavior of commenting/uncommenting code
(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))

;; make command-/ comment code
(global-set-key (kbd "M-/") 'comment-or-uncomment-region-or-line)



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

;; Set key for god mode
;; doesn't work for ESC. Some program must be interfering with that key.)
(global-set-key (kbd "C-d") #'god-mode-all)
;; Since god mode is activated through god-mode-all, make sure no buffers are skipped.
(setq god-exempt-major-modes nil)
(setq god-exempt-predicates nil)

;; Close window/buffer w/ C-0 instead of (or in addition to) C-x 0.
;; NOT WORKING
(global-set-key (kbd "C-p") 'delete-window)

;; Switch window w/ C-o instead of (or in addition to) C-x o.
(global-set-key (kbd "C-o") 'other-window)
;; or Switch window w/ C-right, C-left
(windmove-default-keybindings 'control)

;; Manually run the init.el file.
(defun load-init ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))
;; Don't use C-i because that's literally the tab character.
(global-set-key (kbd "C-x i") 'load-init)

