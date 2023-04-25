;; Wrapper to enable/disable unmodified-buffer.
;;
;; It adds MELPA to the registry list if not already there, downloads and installs unmodified-buffer if not already there, and enables unmodified-buffer.

;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

;; Download unmodified-buffer
(unless (package-installed-p 'unmodified-buffer)
        (package-install 'unmodified-buffer))

;; Enable Unmodified Buffer
(require 'unmodified-buffer)
(add-hook 'after-init-hook 'unmodified-buffer-global-mode)
