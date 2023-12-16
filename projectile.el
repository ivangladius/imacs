(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :config
  (define-key space-map "p" projectile-command-map))
