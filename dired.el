
;; DIRED

;; preview files and directories in other window live like ranger

;; copy file from one dired split to the other split
(setq dired-dwim-target t)

;;(setq my/dired-live-preview-buffer-name nil)
(setq my/dired-live-preview-active nil)
(setq my/dired-live-preview-buffer-list '())
(setq my/dired-live-preview-current-buffer-list '())


(defun my/dired-live-preview-current-windows ()
  "get a list of current visible open buffers"
  (mapcar #'buffer-name (mapcar #'window-buffer (window-list))))

(defun my/dired-live-preview-add-to-buffer-list ()
  "add buffers visited by live preview"
  (cl-pushnew (buffer-name) my/dired-live-preview-buffer-list))

(defun my/dired-live-preview-kill-buffer-list ()
  (interactive)
  (let ((open-windows (my/dired-live-preview-current-windows)))
	(dolist (buffer my/dired-live-preview-buffer-list)
	  (when (not (member buffer open-windows))
	    (and buffer 
		 (kill-buffer buffer)))
	(setq my/dired-live-preview-buffer-list nil))))

(defun my/dired-live-preview-toggle ()
  (interactive)
  (my/dired-live-preview-kill-buffer-list)
  (my/dired-live-preview-start-if-deactive)
  (setq my/dired-live-preview-active (not my/dired-live-preview-active)))

(defun my/dired-live-preview-start-if-deactive ()
  (when (null my/dired-live-preview-active)
	(setq my/dired-live-preview-buffer-name (buffer-name))
	(delete-other-windows)
	(dired-find-file-other-window)
	(my/dired-live-preview-add-to-buffer-list)
	(call-interactively 'ace-window)))


(defun my/dired-live-preview-up ()
  (interactive)
  (if my/dired-live-preview-active
      (progn
	;;		(kill-current-buffer)
	(delete-other-windows)
	(call-interactively 'dired-previous-line)
	(dired-find-file-other-window)
	(my/dired-live-preview-add-to-buffer-list)
	(call-interactively 'ace-window))
    (call-interactively 'dired-previous-line)))


(defun my/dired-live-preview-down ()
  (interactive)
  (if my/dired-live-preview-active
      (progn
	;;		(kill-current-buffer)
	(delete-other-windows)
	(call-interactively 'dired-next-line)
	(dired-find-file-other-window)
	(my/dired-live-preview-add-to-buffer-list)
	(call-interactively 'ace-window))
    (call-interactively 'dired-next-line)))

(defun my/dired-live-preview-leave ()
  (interactive)
  (my/dired-live-preview-kill-buffer-list)
  (dired-find-file)
;;  (delete-other-windows)
  (if (eq major-mode 'dired-mode)
      (progn
	(dired-find-file-other-window)
	(call-interactively 'ace-window))))


(defun my/dired-live-preview-kill ()
  (interactive)
  (kill-current-buffer)
  (my/dired-live-preview-kill-buffer-list))



;; (ryo-modal-major-mode-keys
;;  'dired-mode
;;  ("i" my/dired-live-preview-up)
;;  ("k" my/dired-live-preview-down))

;; (ryo-modal-major-mode-keys
;;  'dired-mode
;;  ("SPC k" my/dired-live-preview-kill))

 (define-key dired-mode-map (kbd "<return>") #'my/dired-live-preview-leave)

(define-key dired-mode-map (kbd "M-w") #'my/dired-live-preview-toggle)
(define-key dired-mode-map (kbd "M-e") #'(lambda ()
					   (interactive)
					   (print my/dired-live-preview-buffer-list)))
(define-key dired-mode-map (kbd "M-c") #'(lambda ()
					   (interactive)
					   (print my/dired-live-preview-current-buffer-list)))

(define-key dired-mode-map (kbd "M-r") #'my/dired-live-preview-kill-buffer-list)
