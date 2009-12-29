(setq auto-mode-alist
            (append
             ;; File name (within directory) starts with a dot.
             '(("\\.irbrc'" . ruby-mode))
             auto-mode-alist))
(provide 'auto-modes)