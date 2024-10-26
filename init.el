

(setq package-install-upgrade-built-in t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


(setq essential-packages '(use-package))
			   

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package essential-packages)
  (unless (package-installed-p package)
    (package-install package)))

(setq native-comp-async-report-warnings-errors nil)


;;(defun client-persp-new ()
;;  (interactive)
;;  (let* ((persp-number (length (persp-names)))
;;	 (persp-new-name (format "%d" (+ persp-number 1))))
;;    (persp-switch persp-new-name)))

(defun client-persp-new (path &optional no-file)
  "Open the current directory in Dired and create a new workspace."
  (interactive)
  (let* ((persp-number (length (persp-all-names)))
         (persp-new-name (format "%d" (+ persp-number 1))))
    (unless (display-graphic-p)
      ;; activate mouse-based scrolling
      (xterm-mouse-mode 1)
      (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
      (global-set-key (kbd "<mouse-5>") 'scroll-up-line))
    (persp-switch persp-new-name)
    (when (eq no-file nil)
      (find-file path))))
					; (switch-to-buffer path)
					; (persp-add-buffer path)))


(load "~/.emacs.d/settings.el")

(load "~/.emacs.d/evil.el")
;;(load "~/.emacs.d/evil-snipe.el")

;; FILE HANDLING
(load "~/.emacs.d/smex.el")
(load "~/.emacs.d/ivy.el")
(load "~/.emacs.d/counsel.el")
(load "~/.emacs.d/perspective.el")

;; WINDOW
(load "~/.emacs.d/window.el")
(load "~/.emacs.d/winner.el")
;; (load "~/.emacs.d/oneonone.el")

;; LSP
(load "~/.emacs.d/lsp-mode.el")
(load "~/.emacs.d/company.el")

;; MISC

(load "~/.emacs.d/dired.el")
(load "~/.emacs.d/yas.el")
(load "~/.emacs.d/disaster.el")
(load "~/.emacs.d/which-key.el")
(load "~/.emacs.d/isearch.el")
(load "~/.emacs.d/quickrun.el")
(load "~/.emacs.d/eshell.el")
(load "~/.emacs.d/vterm.el")
(load "~/.emacs.d/auto-sudoedit.el")
(load "~/.emacs.d/auto-sudoedit.el")
(load "~/.emacs.d/pdf.el")
(load "~/.emacs.d/gdb.el")
(load "~/.emacs.d/evil-easymotion.el")
(load "~/.emacs.d/ace-window.el")
(load "~/.emacs.d/projectile.el")
(load "~/.emacs.d/magit.el")
(load "~/.emacs.d/programming.el")
(load "~/.emacs.d/sly.el")









(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("8d8207a39e18e2cc95ebddf62f841442d36fcba01a2a9451773d4ed30b632443" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "e4a702e262c3e3501dfe25091621fe12cd63c7845221687e36a79e17cf3a67e0" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "013728cb445c73763d13e39c0e3fd52c06eefe3fbd173a766bfd29c6d040f100" "4ade6b630ba8cbab10703b27fd05bb43aaf8a3e5ba8c2dc1ea4a2de5f8d45882" "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e" "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69" "0c83e0b50946e39e237769ad368a08f2cd1c854ccbcd1a01d39fdce4d6f86478" "38c0c668d8ac3841cb9608522ca116067177c92feeabc6f002a27249976d7434" "a9eeab09d61fef94084a95f82557e147d9630fbbb82a837f971f83e66e21e5ad" "dccf4a8f1aaf5f24d2ab63af1aa75fd9d535c83377f8e26380162e888be0c6a9" "c517e98fa036a0c21af481aadd2bdd6f44495be3d4ac2ce9d69201fcb2578533" "02d422e5b99f54bd4516d4157060b874d14552fe613ea7047c4a5cfa1288cf4f" "13096a9a6e75c7330c1bc500f30a8f4407bd618431c94aeab55c9855731a95e1" "680f62b751481cc5b5b44aeab824e5683cf13792c006aeba1c25ce2d89826426" default))
 '(package-selected-packages
   '(sly dap-mode hexrgb auto-sudoedit ccls company counsel disaster doom-themes evil-collection go-mode golang-mode lsp-haskell lsp-ivy lsp-pyright lsp-ui pdf-tools perspective projectile quickrun realgud smartparens smex vterm which-key yasnippet))
 '(persp-show-modestring t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:background "black" :foreground "#f4f4f4" :box nil)))))
