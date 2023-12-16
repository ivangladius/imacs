


(use-package perspective
  :ensure t		     ; use `:straight t` if using straight.el!
  :demand t
  :config
  (global-set-key (kbd "M-1") #'persp-prev)
  (global-set-key (kbd "M-2") #'persp-next)
  (define-key space-w-map (kbd "i") #'persp-switch)
  (define-key space-w-map (kbd "d") #'persp-kill-current)
  (require 'perspective)
  ;(setq persp-show-modestring nil)
  (setq persp-suppress-no-prefix-key-warning t)
  
  (defun persp-kill-current ()
    "kill current active perspective"
    (interactive)
    (persp-kill (persp-current-name)))

  (persp-mode))
