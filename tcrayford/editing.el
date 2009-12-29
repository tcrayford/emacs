(setq semanticdb-default-save-directory "~/.semantic")

;; you may want to bind it to a different key

(setq next-line-add-newlines nil)

;save history on exit
(setq eshell-save-history-on-exit t)

; disable backup files (foo~)
(setq backup-inhibited t)

; disable auto-save files
(setq auto-save-default nil)
(provide 'editing)