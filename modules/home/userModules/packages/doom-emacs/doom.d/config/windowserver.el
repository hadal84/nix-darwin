;;; function to apply current theme to new frames in the QUARTZ display server
(defun hadal84/fix-new-frame-theme (&optional frame)
  (with-selected-frame (or frame (selected-frame))
    (when (display-graphic-p)
      (load-theme doom-theme t))))

;;; hook that calls the frame fixer function upon frame generation
(add-hook 'after-make-frame-functions #'hadal84/fix-new-frame-theme)

;;; function that starts the inital frame in a fullscreen state
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
