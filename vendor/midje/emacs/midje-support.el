;;; These are some support routines I used before I switched to
;;; Swank. The good stuff has been moved to
;;; clojure-jump-to-file.el. I'll keep this around for a while.


(require 'clojure-mode)
(provide 'midje-support)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

(defvar midje-root (expand-file-name "~"))
(defvar midje-filename-stash '())
(defvar midje-inferior-lisp-program "lein repl")

(defun midje-clojure-mode-hook ()
  (local-set-key "\^c\^c" 'midje-eval-defun-and-go-to-end)
  (local-set-key "\^c\^v" 'midje-eval-defun-and-run-tests)
)
(add-hook 'clojure-mode-hook 'midje-clojure-mode-hook)


(defun midje (here)
  "Start the inferior Clojure process in given directory.
Enable Midje support commands."
  (interactive "DDirectory: ")
  (with-temp-buffer
    (midje-root here)
    (setq default-directory here)
    (setq clojure-inferior-lisp-program midje-inferior-lisp-program)
    (if (get-buffer "*inferior-lisp*") (kill-buffer "*inferior-lisp*"))
    ;; TODO: figure out how to get rid of double-echo.
    (inferior-lisp clojure-inferior-lisp-program))
)

(defun midje-root (here)
  "Set the root directory that."
  (interactive "DDirectory: ")
  ;; This wants to work in all buffers (or all shell buffers)?
  (global-set-key "\^h\^h" 'midje-visit-source)    
  (setq midje-root (expand-file-name here))
  (setq midje-filename-stash '()))



(defun midje-eval-defun-and-go-to-end ()
  (interactive)
  (display-buffer "*inferior-lisp*" 'not-this-window)
  (lisp-eval-defun)
  (midje-show-end-of-inferior-lisp-buffer)
)

(defun midje-eval-defun-and-run-tests ()
  (interactive)
  (display-buffer "*inferior-lisp*" 'not-this-window)
  (lisp-eval-defun)
  (comint-send-string (inferior-lisp-proc) "(run-tests)\n")
  (midje-show-end-of-inferior-lisp-buffer)
)

(defun midje-visit-source ()
  "If the current line contains text like '../src/program.clj:34', visit 
that file in the other window and position point on that line."
  (interactive)
  (let* ((start-boundary (save-excursion (beginning-of-line) (point)))
         (regexp (concat "\\([ \t\n\r\"'([<{]\\|^\\)" ; non file chars or
                                                      ; effective
                                                      ; beginning of file  
                         "\\(.+\\.clj\\):\\([0-9]+\\)" ; file.rb:NNN
			 "\\(\\+[0-9]\\)?"
			 )) 
         (matchp (save-excursion
                  (end-of-line)
                  ;; if two matches on line, the second is most likely
                  ;; to be useful, so search backward.
                  (re-search-backward regexp start-boundary t))))

    (if matchp
	(let ((file (midje-match-part 2))
	      (line (midje-match-part 3))
	      (increment (midje-match-part 4)))
	  (midje-goto file line increment))
      (error "No Clojure location on line."))))





(defun midje-show-end-of-inferior-lisp-buffer ()
  (let ((home (selected-window)))
    (select-window (get-buffer-window "*inferior-lisp*"))
    (goto-char (point-max))
    (select-window home)))


(defun midje-reload-filename-stash (dir)
  (setq midje-filename-stash
	(split-string
	 (shell-command-to-string
	  (concat "find "
		  (shell-quote-argument dir)
		  " -name "
		  (shell-quote-argument "*.clj")
		  " -print "))))
  nil)

(defun midje-matching-file (file)
  (message (concat "Looking for this file: " file))
  (let* ((regexp (concat "/" file "$")))
    (find-if (lambda (fullpath) (string-match regexp fullpath))
	     midje-filename-stash))
)

(defun midje-goto (file line increment)
  (let ((relevant-file (or (midje-matching-file file)
			   (midje-reload-filename-stash midje-root)
			   (midje-matching-file file))))
    (message (concat "relevant file is " relevant-file))
    (message increment)
    (if (not relevant-file) 
	(error (concat "No Clojure file matches " file))
      (find-file-other-window relevant-file)
      (goto-line (string-to-int line))
      (if increment 
	  (search-forward "=>" nil nil (string-to-int increment)))))
)

(defun midje-match-part (n)
  (if (match-beginning n)
      (buffer-substring (match-beginning n) (match-end n))
    nil))

