
(require 'esh-mode)

(defun eshell-beginning-of-line ()
  "when pressing beginning of line go to $ sign instead of complete left of screen"
  (interactive)
  (re-search-backward "$" nil t nil))



(defun eshell-clear-all ()
  (interactive)
  (eshell/clear 1))

(define-key eshell-mode-map (kbd "M-]") #'eshell-previous-matching-input-from-input)
(define-key eshell-mode-map (kbd "M-}") #'eshell-clear-all)

;; (ryo-modal-major-mode-keys
;;  'eshell-mode
;;  ("a" eshell-bol)
;;  ("w" eshell-bol)
;;  ("b" eshell-bol :exit t))


;; (defun spawn-gef ()
;;   (interactive)
;;   (call-process-shell-command "kitty&" nil 0))
