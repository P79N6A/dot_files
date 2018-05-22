(global-unset-key (kbd "s-q"))
(global-set-key (kbd "s-l") 'evil-avy-goto-line)
(global-set-key (kbd "s-.") #'(lambda () (interactive) (eval avy-last-goto-entity)))
(global-set-key (kbd "<s-S-return>") 'spacemacs/toggle-maximize-buffer)
(global-set-key (kbd "s-t") 'split-window-right-and-focus)
(global-set-key (kbd "s-T") 'split-window-below-and-focus)
(global-set-key (kbd "s-o") 'helm-projectile-find-file)
(global-set-key (kbd "s-O") 'helm-projectile-find-file-dwim)
(global-set-key (kbd "s-f") 'spacemacs/helm-find-files)
(global-set-key (kbd "M-s-f") 'helm-find)
(global-set-key (kbd "C-x C-f") 'spacemacs/helm-find-files)
(global-set-key (kbd "s-F") 'helm-locate)
(global-set-key (kbd "s-B") '(lambda () (interactive) (condition-case nil (progn (setq saved-ido-make-buffer-list-hook ido-make-buffer-list-hook) (setq ido-make-buffer-list-hook nil) (helm-mini) (setq ido-make-buffer-list-hook saved-ido-make-buffer-list-hook)) (error (progn (setq ido-make-buffer-list-hook saved-ido-make-buffer-list-hook) (helm-keyboard-quit))))))
(global-set-key (kbd "s-b") 'helm-projectile-switch-to-buffer)
(global-set-key (kbd "s-p") 'helm-projectile-switch-project)
(global-set-key (kbd "s-P") 'spacemacs/helm-persp-switch-project)
(global-set-key (kbd "s-L") 'spacemacs/helm-perspectives)
(global-set-key (kbd "s-;") '(lambda() (interactive) (if (and (inf-ruby-buffer) (equal (inf-ruby-buffer) (current-buffer))) (delete-window) (if (or (not (inf-ruby-buffer)) (not (comint-check-proc (inf-ruby-buffer))))  (rvm-use-default)) (call-interactively 'inf-ruby))))
(global-set-key (kbd "s-[") 'previous-buffer)
(global-set-key (kbd "s-]") 'next-buffer)
(global-set-key (kbd "s-/") 'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "s-\\") 'lx/switch-to-previous-perp)
(global-set-key (kbd "s-M-'") #'(lambda () (interactive) (call-interactively 'split-window-right-and-focus) (ansi-term "/bin/zsh")))

(global-set-key (kbd "s-'") #'(lambda (prefix)
                                (interactive "P")
                                (if prefix
                                    (switch-to-buffer (get-buffer "*ansi-term-0*"))
                                  (if (string= "term-mode" major-mode)
                                      (shell-pop-out)
                                    (let ((shell-pop-autocd-to-working-dir nil))
                                      (spacemacs/shell-pop-ansi-term 0)
                                      (when shell-pop-last-shell-buffer-name
                                        (with-current-buffer shell-pop-last-shell-buffer-name
                                          (end-of-buffer)
                                          (backward-char))))))))

(global-set-key (kbd "s-\"") #'projectile-shell-pop)
(global-set-key (kbd "s-n") '(lambda () (interactive) (switch-to-buffer-other-window (generate-new-buffer "*Untitled*"))))
(global-set-key (kbd "s-N") '(lambda () (interactive) (switch-to-buffer (generate-new-buffer "*Untitled*"))))
(global-set-key (kbd "s-w") 'delete-window)
(global-set-key (kbd "s-W") '(lambda () (interactive) (kill-this-buffer) (delete-window)))
(global-set-key (kbd "M-s-n") '(lambda () (interactive) (make-frame-command)))
(global-set-key (kbd "M-s-w") 'delete-frame)
(global-set-key (kbd "s-C") 'bzg-big-fringe-mode)
(global-set-key (kbd "s-g") #'(lambda (arg)
                                (interactive "P")
                                (if arg
                                    (progn
                                      (require 'magit-mode)
                                      (let ((magit-buf (--find (s-starts-with? "magit:" (buffer-name it)) (magit-mode-get-buffers))))
                                        (if magit-buf (switch-to-buffer magit-buf) (magit-status))))
                                  (magit-status))))
(global-set-key (kbd "s-r c") #'(lambda (arg)
                                  (interactive "P")
                                  (let ((console (get-buffer (format "**%srailsconsole**" (projectile-project-name)))))
                                    (if (and arg console)
                                        (switch-to-buffer console)
                                      (call-interactively 'projectile-bundler-console)))))
(global-set-key (kbd "s-r s") 'projectile-rails-server)
(global-set-key (kbd "s-r s-r") 'rvm-activate-corresponding-ruby)
(global-set-key (kbd "s-r /" ) 'lx/helm-ag-search-pry-breakpoints)

(global-set-key (kbd "s-u") 'universal-argument)
(define-key universal-argument-map (kbd "s-u") 'universal-argument-more)
(global-set-key [M-s-tab] #'spacemacs/alternate-buffer-in-persp)
;; (global-set-key [M-S-tab] #'projectile-project-switch-to-alternate-buffer)
(global-set-key [M-S-tab] #'(lambda () (interactive) (switch-to-buffer (nth 2 (projectile-project-buffers)))))

(global-set-key (kbd "C-g") '(lambda () (interactive) (spacemacs/evil-search-clear-highlight) (keyboard-quit)))
(global-set-key [M-tab] 'spacemacs/alternate-buffer)
(global-set-key (kbd "<f5>") #'(lambda () (interactive) (unless (boundp 'ggtags-mode) (ggtags-mode)) (projectile-regenerate-tags)))
(global-set-key (kbd "M-@") 'set-mark-command)
(global-set-key (kbd "s-m") 'set-mark-command)
(global-set-key (kbd "C-x s-m") 'pop-global-mark)
(global-set-key (kbd "<f1>") #'(lambda () (interactive) (condition-case nil (neotree-find-project-root) (error (neotree-toggle)))))
(global-set-key (kbd "<S-f1>") #'(lambda () (interactive) (neotree-toggle)))
(global-set-key [mouse-4] '(lambda () (interactive) (scroll-down 1)))
(global-set-key [mouse-5] '(lambda () (interactive) (scroll-up 1)))

(global-set-key (kbd "M-h") #'evil-window-left)
(global-set-key (kbd "M-l") #'evil-window-right)
(global-set-key (kbd "M-j") #'lx/window-down-fallback-to-switch-frame)
(global-set-key (kbd "M-k") #'lx/window-up-fallback-to-switch-frame)
(global-set-key (kbd "M-H") #'lx/window-move-far-left)
(global-set-key (kbd "M-J") #'lx/window-move-very-bottom)
(global-set-key (kbd "M-K") #'lx/window-move-very-top)
(global-set-key (kbd "M-L") #'lx/window-move-far-right)

(global-set-key (kbd "s-M") #'helm-mu)

(global-set-key (kbd "s-0") 'spacemacs/persp-switch-to-0)
(global-set-key (kbd "s-1") 'spacemacs/persp-switch-to-1)
(global-set-key (kbd "s-2") 'spacemacs/persp-switch-to-2)
(global-set-key (kbd "s-3") 'spacemacs/persp-switch-to-3)
(global-set-key (kbd "s-4") 'spacemacs/persp-switch-to-4)
(global-set-key (kbd "s-5") 'spacemacs/persp-switch-to-5)
(global-set-key (kbd "s-6") 'spacemacs/persp-switch-to-6)
(global-set-key (kbd "s-7") 'spacemacs/persp-switch-to-7)
(global-set-key (kbd "s-8") 'spacemacs/persp-switch-to-8)
(global-set-key (kbd "s-9") 'spacemacs/persp-switch-to-9)
(global-set-key (kbd "s-{") 'persp-prev)
(global-set-key (kbd "s-}") 'persp-next)

(global-set-key (kbd "M-0") 'winum-select-window-0)
(global-set-key (kbd "M-1") 'winum-select-window-1)
(global-set-key (kbd "M-2") 'winum-select-window-2)
(global-set-key (kbd "M-3") 'winum-select-window-3)
(global-set-key (kbd "M-4") 'winum-select-window-4)
(global-set-key (kbd "M-5") 'winum-select-window-5)
(global-set-key (kbd "M-6") 'winum-select-window-6)
(global-set-key (kbd "M-7") 'winum-select-window-7)
(global-set-key (kbd "M-8") 'winum-select-window-8)
(global-set-key (kbd "M-9") 'winum-select-window-9)

(global-set-key (kbd "C-M-s-)") 'winum-select-window-0)
(global-set-key (kbd "C-M-s-!") 'winum-select-window-1)
(global-set-key (kbd "C-M-s-@") 'winum-select-window-2)
(global-set-key (kbd "C-M-s-#") 'winum-select-window-3)
(global-set-key (kbd "C-M-s-$") 'winum-select-window-4)
(global-set-key (kbd "C-M-s-%") 'winum-select-window-5)
(global-set-key (kbd "C-M-s-^") 'winum-select-window-6)
(global-set-key (kbd "C-M-s-&") 'winum-select-window-7)
(global-set-key (kbd "C-M-s-*") 'winum-select-window-8)
(global-set-key (kbd "C-M-s-(") 'winum-select-window-9)

(global-set-key (kbd "<f12>") #'lx/open-mail-custom-layout-or-mu4e-main)

(global-set-key (kbd (if (display-graphic-p) "<C-return>" "C-RET")) #'spacemacs/jump-to-definition)
(global-set-key (kbd (if (display-graphic-p) "<s-return>" "s-RET")) #'spacemacs/jump-to-definition-other-window)
