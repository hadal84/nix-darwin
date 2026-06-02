;;; --- MicroPython mpremote Integration ---
;;; A suite of functions for interacting with a MicroPython board
;;; using the 'mpremote' command-line tool.

(defun mpremote-list-devices ()
  "List all available serial devices mpremote can connect to.
The output is shown in the *Shell Command Output* buffer."
  (interactive)
  (message "Searching for MicroPython devices...")
  (shell-command "mpremote devs"))

(defun mpremote-upload-current-file ()
  "Upload the current buffer's file to the device's root directory."
  (interactive)
  (let* ((local-file (buffer-file-name))
         (remote-file (file-name-nondirectory local-file)))
    (if (not local-file)
        (message "Buffer is not visiting a file")
      (message "Uploading %s to :%s..." local-file remote-file)
      (shell-command (format "mpremote cp %s :%s"
                             (shell-quote-argument local-file)
                             (shell-quote-argument remote-file)))
      (message "Upload complete: %s -> :%s" local-file remote-file))))

(defun mpremote-run-current-file ()
  "Execute the current buffer's Python file on the device without saving it there.
The output is shown in the *Shell Command Output* buffer."
  (interactive)
  (let ((local-file (buffer-file-name)))
    (if (not local-file)
        (message "Buffer is not visiting a file")
      (message "Running %s on device..." local-file)
      (shell-command (format "mpremote run %s"
                             (shell-quote-argument local-file))))))

(defun mpremote-list-files ()
  "List files in the root directory of the device.
The output is shown in the *Shell Command Output* buffer."
  (interactive)
  (message "Listing files on device...")
  (shell-command "mpremote ls"))

(defun mpremote-remove-file (remote-file)
  "Remove a file from the device's filesystem."
  (interactive "sRemove remote file: ")
  (if (not (string-empty-p remote-file))
      (progn
        (message "Removing :%s from device..." remote-file)
        (shell-command (format "mpremote rm :%s"
                               (shell-quote-argument remote-file)))
        (message "Successfully sent remove command for :%s" remote-file))
    (message "Remove command cancelled.")))

(defun mpremote-reset-board ()
  "Perform a soft reset of the device."
  (interactive)
  (message "Resetting device...")
  (shell-command "mpremote reset")
  (message "Device reset command sent."))

(defun mpremote-open-repl ()
  "Open a new terminal buffer (vterm) and start the mpremote REPL."
  (interactive)
  (unless (fboundp 'vterm)
    (error "vterm is not installed. Please install it via M-x package-install RET vterm"))
  (let ((vterm-buffer (vterm (concat "*mpremote-repl:" (format-time-string "%H-%M-%S")))))
    (with-current-buffer vterm-buffer
      (vterm-send-string "mpremote repl\n"))))


;; --- Keybindings ---
;; We will use "C-c m" as a prefix for all MicroPython commands.
(global-set-key (kbd "C-c m d") #'mpremote-list-devices)       ; d = devices
(global-set-key (kbd "C-c m u") #'mpremote-upload-current-file) ; u = upload
(global-set-key (kbd "C-c m e") #'mpremote-run-current-file)    ; e = execute
(global-set-key (kbd "C-c m l") #'mpremote-list-files)         ; l = list
(global-set-key (kbd "C-c m k") #'mpremote-remove-file)         ; k = kill/remove
(global-set-key (kbd "C-c m x") #'mpremote-reset-board)         ; x = reset
(global-set-key (kbd "C-c m z") #'mpremote-open-repl)           ; z = shell/repl
