;; fix bug with use-package
;; see: https://emacs.stackexchange.com/questions/69066/problem-loading-packages-with-emacs-28
;(setq find-file-visit-truename nil)

;; Use the gnutls package, and prepend a cert to the trust list
;; This is needed because when emacs tries to access MELPA, we need it to trust the Zscaler cert.
(require 'gnutls)
(add-to-list 'gnutls-trustfiles "/usr/local/etc/openssl@3/cert.pem")

;; Set up package.el to work with MELPA, initialize package system
;; This is needed for evil, unmodified-buffer, and in the future other third party packages. I put it here because it should only run once, not once per package.
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
;(add-to-list 'package-archives
;             '("gnu" . ""))
(package-initialize)
(package-refresh-contents)

;; use-package is your BEST FRIEND and PACKAGE MANAGER
;; Install use-package if you don't have it already
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
;; enable use-package
(eval-when-compile
  (require 'use-package))


;; Ivy is a completion engine, and is needed for Counsel.
(use-package ivy
  :ensure t
  :config
;  :diminish ivy-mode
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d%d) ")
  (setq ivy-use-selectable-prompt t))


;; Counsel gives you regex-searchable suggested completions when you enter certain interactive prompts, such as M-x or C-x C-f.
(use-package counsel
  :ensure t
  :config
;  :diminish counsel-mode
  (counsel-mode 1))

;; xclip helps you to copy to clipboard when using terminal emacs
(unless (package-installed-p 'xclip)
  (package-install 'xclip))
;; enable
(eval-when-compile
  (require 'xclip))
(xclip-mode 1)



;;; Set a nice color scheme / theme
;(unless (package-installed-p 'solarized-theme)
;  (package-install 'solarized-theme))
;;; enable
;(eval-when-compile
;  (require 'solarized-theme))
;(load-theme 'solarized-dark t)





;; Delete trailing whitespace on-save
;;(add-hook 'before-save-hook 'delete-trailing-whitespace)



(defun load-directory (directory)
  "Load recursively all `.el' files in DIRECTORY."
  (dolist (element (directory-files-and-attributes directory nil nil nil))
    (let* ((path (car element))
           (fullpath (concat directory "/" path))
           (isdir (car (cdr element)))
           (ignore-dir (or (string= path ".") (string= path ".."))))
      (cond
       ((and (eq isdir t) (not ignore-dir))
        (load-directory fullpath))
       ((and (eq isdir nil) (string= (substring path -3) ".el"))
        (load (file-name-sans-extension fullpath)))))))
;; load all init files in config/ dir
(load-directory "~/.emacs.d/config")





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(solarized-theme xclip counsel ivy unmodified-buffer evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
