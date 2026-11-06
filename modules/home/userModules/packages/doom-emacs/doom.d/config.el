;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(let ((config-dir (expand-file-name "config" doom-user-dir)))
  (when (file-directory-p config-dir)
    (dolist (file (directory-files-recursively config-dir "\\.el$"))
      (load file nil 'nomessage))))
