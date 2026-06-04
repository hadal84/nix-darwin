;;; customization
(setq fancy-splash-image (expand-file-name "~/.config/doom/img/doom6.png" doom-user-dir))
(setq doom-font (font-spec :family "CaskaydiaMono Nerd Font Mono" :size 18)
      doom-variable-pitch-font (font-spec :family "CaskaydiaMono Nerd Font Mono" :size 18))
(load-theme 'kanagawa t)
(custom-theme-set-faces! 'kanagawa
  '(default :background "#000000"))
(setq display-line-numbers-type 'nil)
(custom-set-faces
 '(default ((t (:background "#000000")))))
(set-frame-parameter (selected-frame) 'title-bar-color "#000000")
