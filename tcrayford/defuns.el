(defun backward-kill-line (arg)
  "Kill chars backward until encountering the end of a line."
  (interactive "p")
  (kill-line 0))

(cond ((eq system-type 'darwin)
      (defun fs ()
        (interactive)
        (set-frame-parameter nil 'fullscreen
                             (if (frame-parameter nil 'fullscreen)
                                 nil
                               'fullboth))))

      ((or (eq system-type 'gnu/linux)
          (eq system-type 'linux))
      (defun fs ()
        (interactive)
        ;; TODO: this only works for X. patches welcome for other OSes.
        (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                               '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
        (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                               '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))))

      ((eq system-type 'windows)
      ;;TODO put the win32 thing in here
      (defun fs()
        (interactive)
        "Toggle fullscreen display of current frame (windows only)"
        (cond ((w32-fullscreen-recall 'enabled)
               (w32-fullscreen-remember 'enabled nil)
               (w32-fullscreen-off))
              (t
               (w32-fullscreen-remember 'enabled t)
               (w32-fullscreen-on)))))
)

;; ------ configuration -----
(defvar w32-fullscreen-toggletitle-cmd
   (concat dotfiles-dir "/w32toggletitle.exe")
   "w32toggletitle.exe")

;; ------ code -----
(defun w32-fullscreen-maximize-frame ()
  "Maximize the current frame (windows only)"
  (interactive)
  (w32-send-sys-command 61488))

(defun w32-fullscreen-restore-frame ()
  "Restore a minimized/maximized frame (windows only)"
  (interactive)
  (w32-send-sys-command 61728))

(defun w32-fullscreen-toggle-titlebar ()
  "Toggle display of the titlebar of frame (windows only)"
  (interactive)
  (call-process "H:/w32toggletitle.exe"
		  nil nil nil
		  (frame-parameter (selected-frame) 'window-id))
  (sleep-for 0.2))

(setq *w32-fullscreen-memtable* (make-hash-table))

(defun* w32-fullscreen-recall (var &optional (frame (selected-frame)))
  (cdr (assoc var (gethash frame *w32-fullscreen-memtable*))))

(defun* w32-fullscreen-remember (var val &optional (frame (selected-frame)))
  (let* ((varlist (gethash frame *w32-fullscreen-memtable*))
	 (target (assoc var varlist)))
    (cond (target
	   (setf (cdr target) val))
	  (t
	   (puthash frame (cons (cons var val)
				varlist) *w32-fullscreen-memtable*)))))



(defun w32-fullscreen-on ()
  "Enable fullscreen display of current frame (windows only)"
  (interactive)
  ; - remember interface settings
  (w32-fullscreen-remember 'menu-bar-lines
			   (frame-parameter nil 'menu-bar-lines))
  (w32-fullscreen-remember 'tool-bar-lines
			   (frame-parameter nil 'tool-bar-lines))
  (w32-fullscreen-remember 'vertical-scroll-bars
	(frame-parameter nil 'vertical-scroll-bars))
  ; - set interface settings
  (modify-frame-parameters (selected-frame)
			   '((menu-bar-lines . 0) (tool-bar-lines . 0)
			     (vertical-scroll-bars . nil)))
  (w32-fullscreen-toggle-titlebar)
  (w32-fullscreen-maximize-frame))

(defun w32-fullscreen-off ()
  "Disable fullscreen display of current frame (windows only)"
  (interactive)
  ; - restore interface settings
  (modify-frame-parameters
   (selected-frame)
   `((menu-bar-lines . ,(w32-fullscreen-recall 'menu-bar-lines))
     (tool-bar-lines . ,(w32-fullscreen-recall 'tool-bar-lines))
     (vertical-scroll-bars . ,(w32-fullscreen-recall 'vertical-scroll-bars))))
  (w32-fullscreen-restore-frame)
  (w32-fullscreen-toggle-titlebar))


(defun insert-blank-line-after-current ()
   (interactive)
   (end-of-line)
   (insert "\n"))


;;TODO write swap-window forwards, and swap window-backwards
(defun swap-windows ()
  "If you have 2 windows, it swaps them."
  (interactive)
  (cond ((not (= (count-windows) 2)) (message "You need exactly 2 windows to do this."))
        (t
         (let* ((w1 (first (window-list)))
                (w2 (second (window-list)))
                (b1 (window-buffer w1))
                (b2 (window-buffer w2))
                (s1 (window-start w1))
                (s2 (window-start w2)))
           (set-window-buffer w1 b2)
           (set-window-buffer w2 b1)
           (set-window-start w1 s2)
           (set-window-start w2 s1)))))


;;Taken from http://github.com/defunkt/emacs/
(defun tcrayford-ido-find-config ()
  (interactive)
  (find-file
   (concat "~/.emacs.d/tcrayford/" (ido-completing-read "Config file: "
                                                        (directory-files "~/.emacs.d/tcrayford/" nil "^[^.]")))))

(defun tcrayford-ido-find-project ()
  (interactive)
  (find-file
   (concat "~/Projects/" (ido-completing-read "Project: "
                                              (directory-files "~/Projects/" nil "^[^.]")))))

(defvar *uni-root* "~/Dropbox/Work/Software Engineering/")

(defun tcrayford-ido-find-uni ()
  (interactive)
  (ido-find-file-in-dir *uni-root*))

(defun kill-help ()
  (interactive)
  (progn
    (kill-buffer "*Help*")
    (kill-buffer "*Apropos*")))

(defun hallway-run-tests ()
  (interactive)
  (let ((test-buffer (find-buffer-visiting (format "%stest/%s-test.clj"
                                                   (locate-dominating-file buffer-file-name "src/")
                                                   (file-name-nondirectory (file-name-sans-extension buffer-file-name))))))
    (save-buffer)
        (let ((output  (with-current-buffer test-buffer
                         (clojure-test-run-tests))))
          output
;          (sit-for 1)
 ;         (if
  ;            (string-match ".*0 failures.*" output)
   ;           (message output)
        ;  (switch-to-buffer test-buffer))
          )))

(defun my-kill-minimap ()
  (interactive)
  (minimap-kill)
  (balance-windows))

(defun vendor (library)
  (let* ((file (symbol-name library))
         (normal (concat "~/.emacs.d/vendor/" file))
         (suffix (concat normal ".el")))
    (cond
     ((file-directory-p normal)
      (add-to-list 'load-path normal)
      (require library))
     ((file-directory-p suffix)
      (add-to-list 'load-path suffix)
      (require library))
     ((file-exists-p suffix)
      (require library)))))

(provide 'defuns)