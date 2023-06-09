;; Always display line numbers.
;;
;; see: https://emacs.stackexchange.com/questions/278/how-do-i-display-line-numbers-in-emacs-not-in-the-mode-line
;; note: In the future, it may be better to not use the global mode but rather enable line numbers in different modes individually, since you may not actually want it in every single mode. Anyway, let's see how this looks.
(global-display-line-numbers-mode)

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



;; Delete trailing whitespace on-save
;;(add-hook 'before-save-hook 'delete-trailing-whitespace)

