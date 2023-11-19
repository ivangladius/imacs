


(defun my/quickrun ()
  (interactive)
  (call-interactively 'save-buffer)
  (quickrun)
  (call-interactively 'ace-window))

(use-package quickrun
  :ensure t
  :config
  (global-set-key (kbd "M-B") #'my/quickrun))
