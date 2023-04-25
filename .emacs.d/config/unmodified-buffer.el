;; Wrapper to enable/disable unmodified-buffer.
;;
;; It downloads and installs unmodified-buffer if not already there, and enables unmodified-buffer.

;; Download unmodified-buffer
(unless (package-installed-p 'unmodified-buffer)
        (package-install 'unmodified-buffer))

;; Enable Unmodified Buffer
(require 'unmodified-buffer)
(add-hook 'after-init-hook 'unmodified-buffer-global-mode)
