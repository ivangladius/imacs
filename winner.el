
(use-package winner
  :ensure t 
  :demand t
  :config
  (define-key space-map (kbd "9") #'winner-undo)
  (define-key space-map (kbd "8") #'winner-redo)
  :config
  (winner-mode))
