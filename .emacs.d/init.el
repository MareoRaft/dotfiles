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
 '(package-selected-packages '(unmodified-buffer evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
