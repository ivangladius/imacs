
(require 'window)

(use-package lsp-mode
  :ensure t
  :hook ((rust-mode . lsp-deferred))
  :config
  (define-key evil-normal-state-map (kbd "gd") #'lsp-find-definition)
  (define-key evil-normal-state-map (kbd "gD") #'my-lsp-find-definition-new-window)
  (define-key evil-normal-state-map (kbd "gr") #'my/lsp-find-references)
  (define-key evil-normal-state-map (kbd "gs") #'lsp-ivy-global-workspace-symbol)
  (define-key evil-normal-state-map (kbd "gS") #'my-lsp-ivy-global-workspace-symbol-new-window)
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024))
  (setq lsp-idle-delay 0.100)
  (setq lsp-log-io nil)

  (setq lsp-enable-symbol-highlighting t)
  (setq lsp-ui-doc-enable nil)
  (setq lsp-lens-enable nil)
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-sideline-show-code-actions nil)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-modeline-code-actions-enable nil)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-modeline-diagnostics-enable nil)
  (setq lsp-signature-auto-activate nil)
  (setq lsp-diagnostics-provider :none)
  :commands lsp)


(require 'lsp-mode)

(use-package rust-mode
  :ensure t)



(defun screen-full-p ()
  "if more then 2 windows are there return true"
  (and (>= (count-windows) 2) t))

(defun my-lsp-find-definition-new-window ()
  "open definition in vertical split window"
  (interactive)
  (if (screen-full-p)
      (split-below)
    (split-right))
  (call-interactively 'lsp-find-definition))

(defun my-lsp-ivy-global-workspace-symbol-new-window ()
  (interactive)
  (if (screen-full-p)
      (split-below)
    (split-below))
  (call-interactively 'lsp-ivy-global-workspace-symbol))


(use-package lsp-ui
  :ensure t)

;; PYTHON
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright))))


 ;; (use-package lsp-java
 ;;   :ensure t
 ;;   :hook (java-mode . (lambda ()
 ;;                        (require 'lsp-java))))


(use-package ccls
  :ensure t
  :hook (c-mode . (lambda ()
		    (require 'ccls))))

(use-package lsp-haskell
  :ensure t
  :hook (haskell-mode . (lambda ()
		    (require 'lsp-haskell))))



(use-package lsp-ivy
  :ensure t)

(use-package smartparens
  :ensure t)

;; DAP-MODE
;;(add-to-list 'load-path "~/programs/dap-mode")
(use-package dap-mode
   :ensure t
  :config
  (setq dap-auto-configure-features '(sessions locals controls tooltip))
   ;; (setq dap-auto-configure-mode t)
   )

;; ;; Associate Rust mode with eglot
;; (require 'eglot)
;; (add-to-list 'eglot-server-programs '(rust-mode . ("rust-analyzer")))

;; (add-hook 'rust-mode-hook
;;           (lambda ()
;; 	    (call-interactively 'eglot)))

(setq my/lsp-xref-buffer-open nil)
(setq my/lsp-xref-buffer-name "*xref*")

(defun my/lsp-find-references ()
  (interactive)
  (lsp-find-references)
  (switch-to-buffer my/lsp-xref-buffer-name)
  (forward-line)
  (xref-goto-xref))

(defun my/lsp-xref-check-open ()
  (if (car (member my/lsp-xref-buffer-name
		   (mapcar #'buffer-name
			   (mapcar #'window-buffer (window-list)))))
      (setq my/lsp-xref-buffer-open t)
    (setq my/lsp-xref-buffer-open nil)))

(defun my/point-number-p ()
  (let ((char (char-after)))
    (while (eq ? char)
      (forward-char)
      (setq char (char-after)))
    (member(char-after) '(?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9))))

(defun my/xref-up ()
  (interactive)
  (if (my/lsp-xref-check-open)
      (progn
	(switch-to-buffer my/lsp-xref-buffer-name)
	(when (= (line-number-at-pos) 2)
	  t)
	(previous-line)
	(redisplay t)
	(while (not (my/point-number-p))
	  (previous-line))
	(xref-goto-xref))))


(defun my/xref-down ()
  (interactive)
  (if (my/lsp-xref-check-open)
      (progn
	(switch-to-buffer my/lsp-xref-buffer-name)
	(forward-line)
	(redisplay t)
	(while (not (my/point-number-p))
	  (forward-line)
	  (redisplay t))
	(xref-goto-xref))))


(global-set-key (kbd "M-P") #'my/xref-up)
(global-set-key (kbd "M-N") #'my/xref-down)
