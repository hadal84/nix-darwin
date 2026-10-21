;; lsp stuff
(add-hook! '(java-mode-hook java-ts-mode-hook) #'eglot-ensure)
