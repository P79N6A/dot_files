;;;###autoload
(defun lx/make-global-org-capture (system-porcess)
  (setq lx/global-org-capture-system-process system-porcess)
  (setq lx/global-org-capture-frame
        (make-frame '((name . "Remember") (width . 80) (height . 20)
                      (top . 100) (left . 350))))
  (select-frame-by-name "Remember")
  (org-capture-string "" "g")
  (delete-other-windows))

;;;###autoload
(defun lx/delete-global-org-capture-frame ()
  (when (and (bound-and-true-p lx/global-org-capture-frame) (eq (selected-frame) lx/global-org-capture-frame))
    (delete-frame lx/global-org-capture-frame)
    (setq lx/global-org-capture-frame nil))
  (when (bound-and-true-p lx/global-org-capture-system-process)
    (if (not (string= lx/global-org-capture-system-process "Emacs"))
        (shell-command-to-string (format "echo 'tell app \"System Events\" to activate app \"%s\"' | osascript" lx/global-org-capture-system-process)))
    (setq lx/global-org-capture-frame nil)))
