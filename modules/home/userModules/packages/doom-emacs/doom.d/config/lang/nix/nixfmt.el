;;; config/nixfmt.el -*- lexical-binding: t; -*-

(add-to-list 'exec-path "/run/current-system/sw/bin")
(setenv "PATH" (concat "/run/current-system/sw/bin:" (getenv "PATH")))

(after! nix-mode
  (setq nixfmt-command "/run/current-system/sw/bin/nixfmt"))

(add-hook 'nix-mode-hook #'nixfmt-on-save-mode)
