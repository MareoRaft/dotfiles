;; xclip helps you to copy to clipboard when using terminal emacs

;; install if not there already
(unless (package-installed-p 'xclip)
  (package-install 'xclip))

;; require
(eval-when-compile
  (require 'xclip))

;; enable
(xclip-mode 1)

