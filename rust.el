

;;https://doc.rust-lang.org/std/

(defun iv-rust-docs ()
  (interactive)
  (start-process "chromium-rust-docs" nil "chromium" "https://doc.rust-lang.org/std/"))

(defun iv-spawn-terminal-here ()
  (interactive)
  (start-process "chromium-rust-docs" nil "alacritty" "--title" "terminal"))

