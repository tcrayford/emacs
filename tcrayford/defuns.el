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
  (ido-find-file-in-dir "~/.emacs.d/tcrayford"))

(defun tcrayford-ido-find-project ()
  (interactive)
  (ido-find-file-in-dir "~/Projects/"))

(defvar *uni-root* "~/Work/")

(defun tcrayford-ido-find-uni ()
  (interactive)
  (ido-find-file-in-dir *uni-root*))

(defun kill-help ()
  (interactive)
  (progn
    (kill-buffer "*Help*")
    (kill-buffer "*Apropos*")))

(defun hallway-test-buffer-for-imp ()
  (interactive)
  (or
   (find-buffer-visiting
    (format "%stest/%s-test.clj"
            (locate-dominating-file (buffer-file-name) "src/")
            (file-name-nondirectory (file-name-sans-extension (buffer-file-name)))))
   (find-buffer-visiting
    (format "%stest/%s_test.clj"
            (locate-dominating-file (buffer-file-name) "src/")
            (file-name-nondirectory (file-name-sans-extension (buffer-file-name)))))))

(defun lazytest-buffer? ()
  (save-excursion
    (save-window-excursion
      (goto-char (point-min))
      (if (search-forward "lazytest" nil t)
        t nil))))

(defun hallway-run-tests ()
  (interactive)
  (progn
    (save-buffer)
    (clojure-test-run-tests)))

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

(defun copy-sexp ()
  (interactive)
  (mark-sexp)
  (kill-ring-save (mark t) (point)))

(defun tcrayford-duplicate-line ()
  (interactive)
  (beginning-of-line)
  (copy-region-as-kill (point) (progn (end-of-line) (point)))
  (textmate-next-line)
  (yank)
  (beginning-of-line)
  (indent-according-to-mode))

(defun tcrayford-backward-kill-line ()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (kill-line))

(defun defunkt-clean-slate ()
  "Kills all buffers except *scratch*"
  (interactive)
  (let ((buffers (buffer-list)) (safe '("*scratch*")))
    (while buffers
      (when (not (member (car buffers) safe))
        (kill-buffer (car buffers))
        (setq buffers (cdr buffers))))))

;; from http://platypope.org/blog/2007/8/5/a-compendium-of-awesomeness
;; I-search with initial contents
(defvar isearch-initial-string nil)

(defun isearch-set-initial-string ()
  (remove-hook 'isearch-mode-hook 'isearch-set-initial-string)
  (setq isearch-string isearch-initial-string)
  (isearch-search-and-update))

(defun isearch-forward-at-point (&optional regexp-p no-recursive-edit)
  "Interactive search forward for the symbol at point."
  (interactive "P\np")
  (if regexp-p (isearch-forward regexp-p no-recursive-edit)
    (let* ((end (progn (skip-syntax-forward "w_") (point)))
           (begin (progn (skip-syntax-backward "w_") (point))))
      (if (eq begin end)
          (isearch-forward regexp-p no-recursive-edit)
        (setq isearch-initial-string (buffer-substring begin end))
        (add-hook 'isearch-mode-hook 'isearch-set-initial-string)
        (isearch-forward regexp-p no-recursive-edit)))))

(defun esk-paredit-nonlisp ()
  "Turn on paredit mode for non-lisps."
  (interactive)
  (set (make-local-variable paredit-space-delimiter-chars) (list ?\"))
  (paredit-mode +1))

(defun window-half-height ()
  (max 1 (/ (1- (window-height (selected-window))) 10)))

(defun scroll-up-half ()
  (interactive)
  (scroll-up (window-half-height)))

(defun scroll-down-half ()
  (interactive)
  (scroll-down (window-half-height)))

(defun fontify-if ()
  (interactive)
  (font-lock-add-keywords nil
                          '(((regexp-opt "if" "cond") 1 font-lock-warning-face t))))

(provide 'defuns)
