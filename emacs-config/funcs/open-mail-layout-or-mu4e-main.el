;;;###autoload
(defun lx/open-mail-custom-layout-or-mu4e-main()
  (interactive)
  (if (string= "@Mu4e" (spacemacs//current-layout-name))
      (call-interactively 'mu4e)
    (spacemacs/custom-perspective-@Mu4e)))
