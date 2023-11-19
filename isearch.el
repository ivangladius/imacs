
(use-package isearch
  :config
  (define-key isearch-mode-map (kbd "<escape>") #'isearch-exit)
  (define-key isearch-mode-map (kbd "M-l") #'isearch-repeat-forward)
  (define-key isearch-mode-map (kbd "M-m") #'isearch-repeat-backward))

(defun isearch-my-exit ()
  (interactive)
  (isearch-exit)
  (backward-char))

