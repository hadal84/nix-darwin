;;; customization
(setq fancy-splash-image (expand-file-name "~/.config/doom/img/nixglass-bottom-padding.png" doom-user-dir))

(setq doom-font (font-spec :family "CaskaydiaMono Nerd Font Mono" :size 18)
      doom-variable-pitch-font (font-spec :family "CaskaydiaMono Nerd Font Mono" :size 18))

(setq display-line-numbers-type 'nil)

(set-frame-parameter (selected-frame) 'title-bar-color "#000000")
(setq frame-title-format nil)

(setq custom-safe-themes t)
(defvar my-stylix-theme-dir (expand-file-name ".config/doom/" (getenv "HOME")))
(defvar my-stylix-theme-file (expand-file-name "base16-stylix-theme.el" my-stylix-theme-dir))
(when (file-exists-p my-stylix-theme-file)
  (add-to-list 'custom-theme-load-path (file-truename my-stylix-theme-dir))
  (load-file (file-truename my-stylix-theme-file))
  (setq doom-theme 'base16-stylix))
