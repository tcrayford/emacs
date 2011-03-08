(setq mac-function-modifier 'super)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'control)
(global-set-key (kbd "C-x m") 'execute-extended-command)

;; Mac keybindings (ish)
(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-`") 'other-window)
(global-set-key (kbd "M-w") (lambda ()
                              (interactive)
                              (kill-buffer (current-buffer))))
(global-set-key (kbd "M-o") 'find-file)
(global-set-key "\C-w" 'backward-kill-word)

(global-set-key (kbd "C-5") 'call-last-kbd-macro)
(global-set-key (kbd "<C-backspace>") 'paredit-mode)

(global-set-key "\C-cp" 'tcrayford-ido-find-config)
(global-set-key "\C-xp" 'tcrayford-ido-find-project)
(global-set-key "\C-xu" 'tcrayford-ido-find-uni)

;; Newline stuff
(global-set-key [M-return] 'textmate-next-line)
(global-set-key [C-return] 'tcrayford-duplicate-line)

(global-set-key [C-tab] 'other-window)

(global-set-key (kbd "C-*") 'isearch-forward-at-point)
(global-set-key "\C-m" 'newline-and-indent)

(global-set-key [(super up)] 'beginning-of-buffer)
(global-set-key [(super down)] 'end-of-buffer)

;; Textmate stuff
(global-set-key (kbd "M-/") 'comment-or-uncomment-region-or-line)
(define-key *textmate-mode-map* (kbd "M-[") 'align)

;;clojure specific
(global-set-key (kbd "s-e") 'clojure-refactoring-ido)
(global-set-key (kbd "C-,") 'hallway-run-tests)
(global-set-key (kbd "s-p") 'slime-eval-print-last-expression)
(global-set-key (kbd "s--") 'mark-sexp)
(global-set-key (kbd "s-w") 'copy-sexp)
(global-set-key (kbd "M-i") 'slime-inspect)

;; viper
()


(provide 'bindings)
