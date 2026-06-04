;; typst autoload
(add-to-list 'auto-mode-alist '("\\.typ\\'" . typst-ts-mode))

;; spellcheck for org & typst papers
(setq ispell-program-name "/opt/homebrew/bin/hunspell")
(setenv "DICPATH" "/opt/homebrew/share/hunspell/")
