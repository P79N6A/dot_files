(define-key evil-normal-state-map "s" #'(lambda () (interactive) (call-interactively 'evil-substitute) (call-interactively 'indent-for-tab-command)))
(define-key evil-motion-state-map (kbd "t") #'evil-avy-goto-char)
(define-key evil-motion-state-map (kbd "T") #'evil-avy-goto-char-2)
;; (define-key evil-motion-state-map (kbd "SPC SPC") #'evil-avy-goto-char-2)
(define-key evil-motion-state-map (kbd "] c") #'diff-hl-next-hunk)
(define-key evil-motion-state-map (kbd "[ c") #'diff-hl-previous-hunk)
(define-key evil-motion-state-map (kbd "C-]") #'jump-to-definition-of-symbol-at-point)
(define-key evil-motion-state-map (kbd "<C-return>") #'(lambda () (interactive) (call-interactively (if (eq major-mode 'org-mode) 'org-insert-heading-respect-content 'jump-to-definition-of-symbol-at-point))))
(define-key evil-motion-state-map (kbd "<s-return>") #'(lambda () (interactive) (pcase major-mode
                                                                                   ('org-mode (call-interactively 'org-insert-heading-respect-content))
                                                                                   ('term-mode (shell-pop--cd-to-cwd
                                                                                                (file-name-directory
                                                                                                 (buffer-file-name (get-buffer shell-pop-last-buffer)))))
                                                                                   (x (call-interactively 'jump-to-definition-of-symbol-at-point-other-window)))))

(define-key evil-motion-state-map (kbd "<s-mouse-1>") #'(lambda (event) (interactive "e") (mouse-set-point event) (jump-to-definition-of-symbol-at-point)))
(define-key evil-motion-state-map (kbd "<s-mouse-3>") #'evil-jumper/backward)
(define-key evil-motion-state-map (kbd "s-q") #'evil-emacs-state)
(define-key evil-lisp-state-map (kbd "s-q") #'evil-emacs-state)
(define-key evil-emacs-state-map (kbd "C-]") #'jump-to-definition-of-symbol-at-point)
(define-key evil-emacs-state-map (kbd "<C-return>") #'(lambda () (interactive) (call-interactively (if (eq major-mode 'org-mode) 'org-insert-heading-respect-content 'jump-to-definition-of-symbol-at-point))))
(define-key evil-emacs-state-map (kbd "<s-return>") #'(lambda () (interactive) (pcase major-mode
                                                                                  ('org-mode (call-interactively 'org-insert-heading-respect-content))
                                                                                  ('term-mode (shell-pop--cd-to-cwd
                                                                                               (file-name-directory
                                                                                                (buffer-file-name (get-buffer shell-pop-last-buffer)))))
                                                                                  (x (call-interactively 'jump-to-definition-of-symbol-at-point-other-window)))))
(define-key evil-emacs-state-map (kbd "<s-mouse-1>") #'(lambda (event) (interactive "e") (mouse-set-point event) (jump-to-definition-of-symbol-at-point)))
(define-key evil-emacs-state-map (kbd "<s-mouse-3>") #'evil-jumper/backward)
(define-key evil-emacs-state-map (kbd "s-q") #'evil-exit-emacs-state)
(define-key evil-normal-state-map (kbd "Y") #'yank-to-end-of-line)
(define-key evil-motion-state-map (kbd "Y") #'yank-to-end-of-line)

(define-key evil-outer-text-objects-map "o" 'evil-a-word)
(define-key evil-inner-text-objects-map "o" 'evil-inner-word)
(define-key evil-outer-text-objects-map "w" 'evil-a-symbol)
(define-key evil-inner-text-objects-map "w" 'evil-inner-symbol)

(define-key evil-normal-state-map "za" (lambda () (interactive) (if (eq major-mode 'web-mode) (web-mode-fold-or-unfold) (evil-toggle-fold))))
(define-key evil-normal-state-map "gf" #'(lambda () (interactive) (if (and (eq 'ruby-mode major-mode) projectile-rails-mode)
                                                                      (call-interactively 'projectile-rails-goto-file-at-point)
                                                                    (call-interactively 'ffap-other-window))))
(define-key evil-ex-completion-map "\C-a" nil)
(define-key evil-ex-completion-map "\C-b" nil)
(define-key evil-ex-completion-map "\C-d" nil)
(define-key evil-ex-completion-map "\C-k" nil)
(define-key evil-normal-state-map (kbd "RET") #'(lambda () (interactive) (evil-insert-newline-below)))
(define-key evil-motion-state-map (kbd "RET") #'(lambda () (interactive) (evil-insert-newline-below)))
(evil-leader/set-key "SPC" 'avy-goto-char-2)
