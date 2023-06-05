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

