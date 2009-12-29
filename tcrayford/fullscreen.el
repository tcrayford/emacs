(if (eq system-type 'darwin)

(defun fs ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
    (if (frame-parameter nil 'fullscreen)
      nil
      'fullboth)))
;;TODO put the win32 thing in here
)