;;; config/lean-mode.el -*- lexical-binding: t; -*-

(use-package! lean4-mode
  :mode "\\.lean\\'"
  :hook (lean4-mode . lsp-deferred))

(after! lsp-mode
  (defadvice! +lean4-silence-inlay-refresh-a (orig-fn &rest args)
    "Silence the spammy Lean 4 workspace/inlayHint/refresh warning."
    :around #'lsp-warn
    (unless (equal args '("Unknown request method: %s" "workspace/inlayHint/refresh"))
      (apply orig-fn args))))
