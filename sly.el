
(use-package sly
  :ensure t
  :config
  (require 'evil)
  (define-key space-o-map "e" #'sly-compile-defun)
  (define-key space-o-map "i" #'sly-interrupt)
  (define-key space-o-map "k" #'sly-macroexpand-all)
  (define-key space-o-map "t" #'sly-toggle-fancy-tree)
  (define-key space-o-map "s" #'eval-last-sexp)
  (setq inferior-lisp-program "sbcl"))
