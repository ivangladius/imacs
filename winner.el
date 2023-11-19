
(use-package winner
  :ensure t 
  :demand t
  :config
  (define-key evil-normal-state-map (kbd "3") #'winner-undo)
  (define-key evil-normal-state-map (kbd "4") #'winner-redo)
  :config
  (winner-mode))
