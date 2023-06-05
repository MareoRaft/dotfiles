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
(package-initialize)
(package-refresh-contents)


;; NOTE: USE PACKAGE HAS A BUG AND IS NOT WORKING
;; use-package is your BEST FRIEND and PACKAGE MANAGER
;; Install use-package if you don't have it already
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
;; enable use-package
(eval-when-compile
  (require 'use-package))




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
