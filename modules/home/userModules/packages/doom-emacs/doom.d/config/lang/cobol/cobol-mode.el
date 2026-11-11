(use-package! cobol-mode
  :mode ("\\.cbl\\'" "\\.cob\\'" "\\.cpy\\'")
  :hook (cobol-mode . eglot-ensure)
  :config
  (setq cobol-tab-width 4
        tab-width 4)
  
  (add-hook 'cobol-mode-hook
            (lambda ()
              (setq display-fill-column-indicator-column 72)
              (display-fill-column-indicator-mode 1)
              
              (font-lock-add-keywords nil
                                      '(("^\\(.\\{7\\}\\)" 1 'font-lock-comment-face prepend))))))

(after! eglot
  (add-to-list 'eglot-server-programs
               `(cobol-mode . ,(lambda (&optional interactive)
                                 (make-process 
                                  :name "cobol-ls"
                                  :command '("/Users/hadal84/.local/share/doom/nix/lsp/cobol/extension/server/native/server-mac")
                                  :connection-type 'pipe
                                  :buffer "*cobol-ls-output*")
                                 
                                 (sleep-for 1.5)
                                 
                                 '("127.0.0.1" 1044)))))

(after! eglot
  (defun my/silence-eglot-unsupported-capability (orig-fn format &rest args)
    "Filter out Eglot's warning for workspace/didChangeConfiguration."
    (unless (and (string-equal format "Server tried to register unsupported capability `%s'")
                 (string-equal (car args) "workspace/didChangeConfiguration"))
      (apply orig-fn format args)))

  (advice-add 'eglot--warn :around #'my/silence-eglot-unsupported-capability))
