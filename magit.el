
(use-package magit
  :ensure t
  :config
  (define-key space-/-map (kbd "s") #'magit-status)
  (define-key space-/-map (kbd "c") #'magit-clone))

