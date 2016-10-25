(with-eval-after-load 'term
  (define-key term-raw-map
    (kbd "<S-return>") #'(lambda ()
                           (interactive)
                           (shell-pop--cd-to-cwd
                            (with-current-buffer (get-buffer shell-pop-last-buffer) (projectile-project-root)))))

  (define-key term-raw-map
    (kbd "<s-return>") #'(lambda ()
                           (interactive)
                           (shell-pop--cd-to-cwd
                            (file-name-directory
                             (buffer-file-name (get-buffer shell-pop-last-buffer))))))

  (define-key term-raw-map (kbd "<s-left>") #'(lambda () (interactive) (comint-send-string (get-buffer-process (current-buffer)) "frame\n")))
  (define-key term-raw-map (kbd "<s-up>") #'(lambda () (interactive) (comint-send-string (get-buffer-process (current-buffer)) "up\n")))
  (define-key term-raw-map (kbd "<s-down>") #'(lambda () (interactive) (comint-send-string (get-buffer-process (current-buffer)) "down\n")))
  (define-key term-raw-map (kbd "<f6>") #'(lambda () (interactive) (comint-send-string (get-buffer-process (current-buffer)) "s\n")))
  (define-key term-raw-map (kbd "<f7>") #'(lambda () (interactive) (comint-send-string (get-buffer-process (current-buffer)) "f\n")))
  (define-key term-raw-map (kbd "<f8>") #'(lambda () (interactive) (comint-send-string (get-buffer-process (current-buffer)) "c\n")))
  (define-key term-raw-map (kbd "<f9>") #'(lambda () (interactive) (comint-send-string (get-buffer-process (current-buffer)) "n\n")))
  (define-key term-raw-map (kbd "M-D") #'(lambda () (interactive) (comint-send-string (get-buffer-process (current-buffer)) "exit-program\n")))

  (let ((map (lookup-key term-raw-map "\e")))
    (define-key map "h" #'evil-window-left)
    (define-key map "l" #'evil-window-right)
    (define-key map "j" #'lx/window-down-fallback-to-switch-frame)
    (define-key map "k" #'lx/window-up-fallback-to-switch-frame)
    (define-key map "H" #'evil-window-move-far-left)
    (define-key map "J" #'evil-window-move-very-bottom)
    (define-key map "K" #'evil-window-move-very-top)
    (define-key map "L" #'evil-window-move-far-right)))