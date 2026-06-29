;;; modules/doom/packages.el -*- lexical-binding: t; no-byte-compile: t; -*-

(package! solaire-mode :disable t) ; fixing themes
(package! autothemer)

; embedded engineering
(package! platformio-mode) ; microcontroller support for the burnt-out PhoeniX

; typst integration for turing complete math notes
(package! typst-ts-mode :recipe (:host nil :repo "https://git.sr.ht/~meow_king/typst-ts-mode"))

; nix formatting, because i dont know the difference between curly brackets and regular brackets
(package! nixfmt) ;that was a joke.

; stylix integration
(package! base16-theme)
