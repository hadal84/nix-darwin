;;; platformio support for the burnt-out phoenix
(use-package! platformio-mode
  ;; This part correctly activates the mode in PlatformIO projects
  :hook ((c-mode . platformio-conditionally-enable)
         (c++-mode . platformio-conditionally-enable))
  :config
  ;; This part defines the helper function that runs on file-open
  (defun platformio-conditionally-enable ()
    "Enable `platformio-mode' if `platformio.ini' exists in the project root."
    (when-let ((project-root (doom-project-root)))
      (when (file-exists-p (expand-file-name "platformio.ini" project-root))
        (platformio-mode 1))))

  (defun my-corrected-platformio-boards ()
    "Fetch the list of boards from PlatformIO and select one."
    (interactive)
    (let ((process-buffer (generate-new-buffer "*platformio-boards*")))
      (message "Fetching boards list from PlatformIO...")
      (async-start
       `(lambda () (shell-command-to-string "platformio boards --json-output"))
       `(lambda (json-output)
          (let* ((data (json-read-from-string json-output))
                 (board-names (mapcar (lambda (board) (cdr (assoc 'name board))) data))
                 (selected-board (completing-read "Select board: " board-names)))
            (when (and selected-board (> (length selected-board) 0))
              (insert selected-board)
              (message "Inserted board: %s" selected-board)))))))

  (advice-add 'platformio-boards :override #'my-corrected-platformio-boards))
