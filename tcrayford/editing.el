(setq semanticdb-default-save-directory "~/.semantic")

(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

(setq next-line-add-newlines nil)

;save history on exit
(setq eshell-save-history-on-exit t)

; disable backup files (foo~)
(setq backup-inhibited t)

(fset 'yes-or-no-p 'y-or-n-p)

; save cursor position within files
(require 'saveplace)
(setq save-place-file "~/.emacs.d/.saveplace")
(setq-default save-place t)

; save minibuffer history
(setq savehist-file "~/.emacs.d/.savehist")

(require 'midnight)

(delete-selection-mode t)

(setq next-line-add-newlines nil)

(setq delete-by-moving-to-trash t)

(global-auto-revert-mode 1)

; disable auto-save files
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

(provide 'editing)