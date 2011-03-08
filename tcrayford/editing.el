(setq semanticdb-default-save-directory "~/.semantic")
(setq show-trailing-whitespace (not buffer-read-only))

;; encoding
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

(setq delete-by-moving-to-trash t)
(setq next-line-add-newlines nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;No bell
(setq ring-bell-function 'ignore)
;;save history on exit
(setq eshell-save-history-on-exit t)

;; disable backup files (foo~)
(setq backup-inhibited t)

(fset 'yes-or-no-p 'y-or-n-p)

;; save minibuffer history
(setq savehist-file "~/.emacs.d/.savehist")

(delete-selection-mode t)

(setq next-line-add-newlines nil)

(global-auto-revert-mode 1)

; line numbering
(require 'linum)
(setq linum-format " %d ") ; space after line number

;; smooth scrolling
(require 'centered-cursor-mode)
(global-centered-cursor-mode t)

;; disable auto-save files
(setq auto-save-default nil)

(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (message "Copied line")
     (list (line-beginning-position)
           (line-beginning-position 2)))))

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-end-position)))))

(defalias 'qrr 'query-replace-regexp)
(defalias 'qr 'query-replace)

; save cursor position within files
(require 'saveplace)
(setq save-place-file "~/.emacs.d/.saveplace")
(setq-default save-place t)
(setq ns-pop-up-frames nil)

; encoding
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

;; all hippie expand fns
(setq hippie-expand-try-functions-list
      '(yas/hippie-try-expand
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name
        try-complete-file-name-partially
        try-complete-lisp-symbol
        try-complete-lisp-symbol-partially
        try-expand-line
        try-expand-line-all-buffers
        try-expand-list
        try-expand-list-all-buffers
        try-expand-whole-kill))

(global-linum-mode t)

(eval-after-load 'clojure-mode
  '(define-clojure-indent (describe 'defun) (it 'defun)))

(provide 'editing)
