;;; config/keys.el -*- lexical-binding: t; -*-

(add-hook 'emacs-startup-hook
          (lambda ()
            (global-set-key (kbd "s-<up>") #'text-scale-increase)
            (global-set-key (kbd "s-<down>") #'text-scale-decrease)
            (message "[keys.el] INFO: Global macOS font scaling bounds successfully initialized.")))
