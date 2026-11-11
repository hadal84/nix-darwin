;; ~/.doom.d/config.el
(use-package! zoxide
  :config
  (add-hook 'find-file-hook #'zoxide-add)
  (add-hook 'dired-mode-hook #'zoxide-add)

  (map! :leader
        :prefix "p"
        :desc "Zoxide search" "z" #'zoxide-travel))
