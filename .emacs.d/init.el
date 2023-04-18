
;; This is great except that I can't get it to work with 'meta (alt). It works great with shift, but then I can't use shift to select multiple lines of code.
(windmove-default-keybindings 'meta)

;; (global-set-key (kbd "M-<left>")  'windmove-left) this code is commented it out. we can delete it soon

;; This means that emacs will remember which windows you had open when it was launched from a particular directory. Therefore the directory from which you launch emacs determines the emacs session.
;; Actually, I think what I was read was wrong. I don't know if it's folder specific.
(desktop-save-mode -1) ;; i put -1 so now it's off.  but i can just as easily comment it out, since it is off by default



;; ezf -- a tool for fuzzy file searching
;; https://www.masteringemacs.org/article/fuzzy-finding-emacs-instead-of-fzf
;; the script would error for me with "*ERROR*: Symbol’s function definition is void: ezf" so I removed it. Not the droids I were looking for anyway.

;; make C-x C-f pull up project-find-file instead of find-file
;;(project-find-file C-f)
;; So it turns out I can do C-x p f to pull up project-find-file
;; works!:
;;(global-unset-key (kbd "C-x C-f"))
;;(global-set-key (kbd "C-x C-f") 'project-find-file)
;; alternative approach
(define-key (current-global-map) [remap find-file] 'project-find-file)



;; Evil stuff...

;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(unmodified-buffer evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Enable Unmodified Buffer
(require 'unmodified-buffer)
(add-hook 'after-init-hook 'unmodified-buffer-global-mode)
