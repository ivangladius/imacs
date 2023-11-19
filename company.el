
(require 'window)

(use-package company
  :ensure t
  :demand t
  :config
  (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (define-key company-active-map (kbd "<tab>") #'company-complete-selection)
  (define-key company-active-map (kbd "<return>") nil)
  (define-key company-active-map (kbd "RET") nil)
  (global-company-mode))

