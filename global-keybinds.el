
(global-set-key (kbd "M-B")
                (lambda ()
                  (interactive)
                  (cl-letf (((symbol-function 'yes-or-no-p) (lambda (_prompt) t)))
                    (save-buffer)
                    (recompile))))

(global-set-key (kbd "M-N") #'compile)

(global-set-key (kbd "M-]") #'next-error)
(global-set-key (kbd "M-[") #'previous-error)

(global-set-key (kbd "M-\)") #'iv-spawn-terminal-here)
(global-set-key (kbd "M-\(") #'iv-rust-docs)
