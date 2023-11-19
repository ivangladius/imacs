

(defun my-gdb-other-frame ()
  (interactive)
  (select-frame (make-frame))
  (call-interactively 'gdb))

(use-package realgud
  :ensure t)
