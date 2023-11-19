

(use-package pdf-tools
  :ensure t
  :config
  (define-key pdf-view-mode-map (kbd "]") #'pdf-view-next-page)
  (define-key pdf-view-mode-map (kbd "]") #'pdf-view-previous-page))
