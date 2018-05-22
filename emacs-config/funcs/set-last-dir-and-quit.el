;;;###autoload
(defun lx/set-last-dir-and-quit ()
  (interactive)
  (let ((dir (lx/current-directory)))
    (if dir (setq last-dir-for-cli-dir-nav dir))
    (call-interactively 'save-buffers-kill-terminal)))
