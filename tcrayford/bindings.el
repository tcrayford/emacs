(setq mac-function-modifier 'super)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'control)
(global-set-key (kbd "C-x m") 'execute-extended-command)
(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-s") 'save-buffer)


(global-set-key (kbd "M-s-h") 'enlarge-window-horizontally)
(global-set-key (kbd "M-s-l") 'shrink-window-horizontally)
(global-set-key (kbd "M-s-j") 'enlarge-window)
(global-set-key (kbd "M-s-k") 'shrink-window)
(global-set-key (kbd "s-\\") 'balance-windows)
(global-set-key (kbd "s-u") 'previous-buffer)
(global-set-key (kbd "s-i") 'next-buffer)

(global-set-key (kbd "C-5") 'call-last-kbd-macro)
(global-set-key (kbd "<C-backspace>") 'paredit-mode)
(global-set-key (kbd "<s-right>") 'next-buffer)
(global-set-key (kbd "<s-left>") 'previous-buffer)
(global-set-key "\C-cp" 'tcrayford-ido-find-config)
(global-set-key "\C-xp" 'tcrayford-ido-find-project)
(global-set-key "\C-xu" 'tcrayford-ido-find-uni)
(global-set-key [M-return] 'textmate-next-line)
(global-set-key [C-return] 'tcrayford-duplicate-line)

(global-set-key (kbd "C-S-k") 'tcrayford-backward-kill-line)
(global-set-key [C-tab] 'other-window)
(global-set-key (kbd "C-*") 'isearch-forward-at-point)
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\M-p" 'slime-eval-defun)
(global-set-key (kbd "s-f") 'jump-to-char-forward)
(global-set-key (kbd "s-F") 'jump-to-char-backward)
(global-set-key (kbd "s-l") 'forward-word)
(global-set-key (kbd "C-=") 'scroll-up-half)
(global-set-key (kbd "C--") 'scroll-down-half)
(global-set-key (kbd "s--") 'mark-sexp)
(global-set-key (kbd "s-=") 'hippie-expand)
(global-set-key (kbd "s-j") 'next-line)
(global-set-key (kbd "s-k") 'previous-line)
(global-set-key (kbd "s-h") 'backward-word)
(global-set-key (kbd "s-0") 'ansi-term)
(global-set-key (kbd "C-'") 'pop-global-mark)
(global-set-key (kbd "M-o") 'find-file)
(global-set-key (kbd "s-x") 'kill-region)
(global-set-key (kbd "M-/") 'comment-or-uncomment-region-or-line)
(define-key *textmate-mode-map* (kbd "M-[") 'align)

(defun move-to-top () (interactive) (move-to-window-line 0))
(defun move-to-bottom () (interactive) (move-to-window-line -1))
(defun move-to-middle () (interactive) (move-to-window-line (/ (window-height) 2)))
(global-set-key (kbd "M-H") 'move-to-top)
(global-set-key (kbd "M-L") 'move-to-bottom)
(global-set-key (kbd "M-K") 'move-to-middle)

(global-set-key (kbd "C-SPC") 'peepopen-goto-file-gui)

;;clj specific
(global-set-key (kbd "s-e") 'clojure-refactoring-ido)
(global-set-key (kbd "C-,") 'hallway-run-tests)
(global-set-key (kbd "s-p") 'slime-eval-print-last-expression)
(global-set-key (kbd "s--") 'mark-sexp)
(global-set-key (kbd "s-w") 'copy-sexp)

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

(defun indent-or-complete ()
  (interactive)
  (if (and (looking-at "$") (not (looking-back "^\\s-*")))
      (hippie-expand nil)
    (indent-for-tab-command)))
(add-hook 'find-file-hooks (function (lambda ()
                                       (local-set-key (kbd "TAB") 'indent-or-complete))))

(global-set-key [(super up)] 'beginning-of-buffer)
(global-set-key [(super down)] 'end-of-buffer)


(provide 'bindings)
