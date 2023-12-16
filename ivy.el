

(use-package ivy
  :ensure t
  :init
  (setq ivy-use-virtual-buffers t
	enable-recursive-minibuffers t
	ivy-height 25)
  (define-key space-i-map (kbd "e") #'counsel-find-file)
  (define-key space-i-map (kbd "r") #'counsel-recentf)
  (define-key space-i-map (kbd "f") #'persp-counsel-switch-buffer)
  (define-key space-i-map (kbd "F") #'counsel-switch-buffer)
  (define-key space-i-map (kbd "E") #'(lambda () (interactive)
					(let ((default-directory "~/"))
					  (counsel-find-file nil default-directory))))
					

  (define-key space-map (kbd "]") #'counsel-yank-pop)
  (global-set-key (kbd "M-s") #'imenu)
  (global-set-key (kbd "M-a") #'counsel-ag)
  (global-set-key (kbd "M-x") #'counsel-M-x)
  (global-set-key (kbd "M-p") #'swiper)
  :config
  (ivy-mode)
  (define-key ivy-minibuffer-map (kbd "<escape>") #'minibuffer-keyboard-quit)
  (define-key ivy-minibuffer-map (kbd "<tab>") #'ivy-alt-done))


(defun ivan-ivy--list-executables ()
  (let ((executables '()))
    (dolist (file (directory-files "."))
      (and (file-executable-p file) (not (file-directory-p file))
	   (cl-pushnew file executables)))
    executables))

(defun ivan-ivy-valgrind-execute ()
  (interactive)
  (let ((executable (ivan-ivy--list-executables)))
    (async-shell-command (concat "valgrind --leak-check=full --track-origins=yes ./"
				 (ivy-read "executable:"  executable)))))
