;ignore version control directories when autocompleting
(setq eshell-cmpl-dir-ignore "\\`\\(\\.\\.?\\|CVS\\|\\.svn\\|\\.git\\)/\\'")
(setq eshell-save-history-on-exit t)
;; TODO if we have a shell in the default location already, don't
; spawn another one
; Set a counter to ensure buffer name uniqueness
(defvar eshell-buffer-count 0)

(setq path "/bin:/usr/bin/:/usr/local/git/bin/")
(setenv "PATH" path)
(setq exec-path '("/usr/local/git/bin/" "/bin/" "/usr/bin/"))

(defun eshell-exotic-prompt-function ()
  "Set the buffer title as well as the prompt."

  (let* ((pwd (eshell/pwd))
         (host (system-name)))

      ; Set the name of the buffer using the username, the hostname,
      ; the eshell-buffer-count and current working directory
    (if (equal mode-name "EShell")
        (rename-buffer
         (format
          "shell %s@%s (%s) : %s"
          (user-login-name) host eshell-buffer-count pwd)))

      ; Set the prompt string
    (concat
     host
     (if (= 0 (user-uid))
         "# "
       "> "))))

  ; Set up the prompt and set the regexp to match the
  ; prompt string
(setq eshell-prompt-function 'eshell-exotic-prompt-function
      eshell-prompt-regexp "^.*[>|#] ")

  ; Increase the buffer count when a new eshell is created
(add-hook 'eshell-mode-hook
            '(lambda ()
              (setq eshell-buffer-count
                    (1+ eshell-buffer-count))))

(add-hook 'eshell-mode-hook
          '(lambda ()
             (setq cursor-type 'bar)))

  ; Decrease the buffer count when an eshell is destroyed
(add-hook 'eshell-exit-hook
          '(lambda ()
             (setq eshell-buffer-count
                   (1- eshell-buffer-count))))

(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
(setq comint-prompt-read-only)

(provide 'my-shell)
