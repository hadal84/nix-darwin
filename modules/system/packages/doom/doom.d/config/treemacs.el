;;; hook to toggle treemacs on projectile-switch
(add-hook 'projectile-after-switch-project-hook #'+treemacs/toggle)

;;; configuration for treemacs
(setq treemacs-follow-mode t)
(setq treemacs-width 35)
(setq treemacs-git-mode 'simple)
(setq treemacs-position 'right)
(setq treemacs-display-in-persp-mode 'right)
