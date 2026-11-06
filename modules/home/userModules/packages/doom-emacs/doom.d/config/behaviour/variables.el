;;; org dir
(setq org-directory "~/org/")

;;; disable auto save since it leads to a fatal segfault under macos26 beta
(auto-save-mode -1)
(setq-default auto-save-default nil)
(setq make-backup-files nil)
(setq auto-save-file-name-transforms nil)

;;; do not prompt when exiting emacs
(setq confirm-kill-emacs nil)
