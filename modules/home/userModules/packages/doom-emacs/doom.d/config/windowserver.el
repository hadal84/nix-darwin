;; Intercept standard Emacs kill signals (including Doom's :q workspace logic)
(defun hadal84/prevent-server-shutdown ()
  "Prevent server from shutting down when quitting the last frame, hide it instead."
  (if (and (= (length (frame-list)) 1)
           (not current-prefix-arg))  ;; Still allow forced quits with prefix arg (e.g. C-u C-x C-c)
      (progn
        (make-frame-invisible (selected-frame))
        nil) ;; Return nil to abort the Emacs shutdown process
    t))      ;; Return t to allow Emacs to exit gracefully

;; Add to the absolute front of the query functions (-100) so it runs before Doom prompts "Really exit?"
(add-hook 'kill-emacs-query-functions #'hadal84/prevent-server-shutdown -100)

;;; function to apply current theme to new frames in the QUARTZ display server
(defun hadal84/fix-new-frame-theme (&optional frame)
  (with-selected-frame (or frame (selected-frame))
    (when (display-graphic-p)
      (load-theme doom-theme t))))

;; Intercept standard shutdown commands (:q, :wq, C-x C-c) to prevent server death
(defadvice! +mac/hide-instead-of-kill-terminal (orig-fn &optional arg)
  "Intercepts kill-terminal (triggered by :q on the last frame) to hide instead."
  :around #'save-buffers-kill-terminal
  (if (and (= (length (frame-list)) 1) (not arg))
      (make-frame-invisible (selected-frame))
    (funcall orig-fn arg)))

;;; hook that calls the frame fixer function upon frame generation
(add-hook 'after-make-frame-functions #'hadal84/fix-new-frame-theme)

;; Hide the initial frame spawned at startup
(add-to-list 'initial-frame-alist '(visibility . nil))

;; Ensure all subsequent emacsclient frames are drawn
(add-to-list 'default-frame-alist '(visibility . t))

;; Start the server internally
(server-start)

