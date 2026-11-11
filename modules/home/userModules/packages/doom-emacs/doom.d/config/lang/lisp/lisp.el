(after! sly
  (setq sly-contribs (remove 'sly-quicklisp sly-contribs)))
(add-hook 'lisp-mode-hook (lambda () (flycheck-mode -1)))

(after! sly
  (let* ((history-dir (expand-file-name "~/.cache/doom/nix/"))
         (history-file (expand-file-name "sly-mrepl-history" history-dir)))
    (unless (file-directory-p history-dir)
      (make-directory history-dir t))
    (unless (file-exists-p history-file)
      (with-temp-file history-file ""))))
