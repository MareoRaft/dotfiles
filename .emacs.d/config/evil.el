;; Wrapper to enable/disable evil mode.
;;
;; It downloads and installs evil if not already there, and enables evil.

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode -1)
