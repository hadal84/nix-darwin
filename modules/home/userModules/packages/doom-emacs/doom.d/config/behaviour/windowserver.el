;;; begin last window hook

(defun doom/force-hide-last-frame (orig-fn &optional frame force)
  "If attempting to delete the last visible frame, force it to hide instead."
  (let* ((target-frame (or frame (selected-frame)))
         (visible-frames (seq-filter #'frame-visible-p (frame-list))))
    (if (and (= (length visible-frames) 1)
             (eq target-frame (car visible-frames)))
        ;; The 't' parameter is critical. It bypasses the C-level safeguard 
        ;; that throws the "sole visible or iconified frame" error.
        (make-frame-invisible target-frame t)
      (funcall orig-fn frame force))))

(advice-add 'delete-frame :around #'doom/force-hide-last-frame)

(defun doom/evil-hide-last-frame (orig-fn &rest args)
  "Intercept window closing in Evil. If it's the last window, hide the frame."
  (let ((visible-frames (seq-filter #'frame-visible-p (frame-list))))
    ;; Check if this is the last window inside the last visible frame
    (if (and (= (length (window-list)) 1)
             (= (length visible-frames) 1))
        (make-frame-invisible (selected-frame) t)
      (apply orig-fn args))))

(with-eval-after-load 'evil
  (advice-add 'evil-quit :around #'doom/evil-hide-last-frame)
  (advice-add 'evil-window-delete :around #'doom/evil-hide-last-frame))

(add-hook 'mac-reopen-app-hook
          (lambda ()
            (let ((visible-frames (seq-filter #'frame-visible-p (frame-list))))
              (when (= (length visible-frames) 0)
                (make-frame-visible (car (frame-list)))))))

;;; end last window hook

;;; function to apply current theme to new frames in the QUARTZ display server
(defun hadal84/fix-new-frame-theme (&optional frame)
  (with-selected-frame (or frame (selected-frame))
    (when (display-graphic-p)
      (load-theme doom-theme t))))

;;; hook that calls the frame fixer function upon frame generation
(add-hook 'after-make-frame-functions #'hadal84/fix-new-frame-theme)

(defun my/mac-escalate-emacsclient-frame ()
  "Force macOS to focus the emacsclient frame by escalating via AppleScript."
  (when (display-graphic-p)
    (mac-do-applescript "tell application \"System Events\" to tell process \"Emacs\" to set frontmost to true")))

(add-hook 'server-after-make-frame-hook #'my/mac-escalate-emacsclient-frame)

;; Ensure all subsequent emacsclient frames are drawn
(setq initial-frame-alist '((visibility . nil)))

;; Start the server internally
(server-start)

