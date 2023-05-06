;; Wrapper to enable/disable god mode.
;;
;; It downloads and installs god mode if not already there, and enable it.
;; ref: https://github.com/emacsorphanage/god-mode

;; Download god mode
(unless (package-installed-p 'god-mode)
  (package-install 'god-mode))

;; Make god mode available but not activated at start up
(require 'god-mode)
