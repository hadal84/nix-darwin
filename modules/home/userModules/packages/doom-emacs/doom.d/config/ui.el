;;; customization
(setq fancy-splash-image (expand-file-name "~/.config/doom/img/nixglass-bottom-padding.png" doom-user-dir))

(setq doom-font (font-spec :family "CaskaydiaMono Nerd Font Mono" :size 18)
      doom-variable-pitch-font (font-spec :family "CaskaydiaMono Nerd Font Mono" :size 18))

;(set-frame-parameter (selected-frame) 'title-bar-color "#000000")

(add-to-list 'default-frame-alist '(mac-appearance . dark))
(add-to-list 'default-frame-alist '(mac-transparent-title-bar . t))

(set-frame-parameter nil 'mac-transparent-titlebar t)
(add-to-list 'default-frame-alist '(mac-transparent-titlebar . t))

;(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
;(add-to-list 'default-frame-alist '(ns-appearance . dark))

(add-to-list 'default-frame-alist '(internal-border-width . 10))
(setq mac-use-title-bar nil)
(setq mac-frame-tabbing nil)

(setq ns-use-proxy-icon nil)
(setq frame-title-format nil)

(setq frame-resize-pixelwise t)
(setq window-resize-pixelwise t)
(add-to-list 'default-frame-alist '(tool-bar-lines . 0))
(add-to-list 'default-frame-alist '(menu-bar-lines . 0))

(setq custom-safe-themes t)
(defvar my-stylix-theme-dir (expand-file-name ".config/doom/" (getenv "HOME")))
(defvar my-stylix-theme-file (expand-file-name "base16-stylix-theme.el" my-stylix-theme-dir))
(when (file-exists-p my-stylix-theme-file)
  (add-to-list 'custom-theme-load-path (file-truename my-stylix-theme-dir))
  (load-file (file-truename my-stylix-theme-file))
  (setq doom-theme 'base16-stylix))
