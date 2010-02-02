(add-to-list 'load-path (expand-file-name  "~/.emacs.d/tcrayford/"))

(require 'defuns)

;; Maybe for university stuff?
;; TODO write a function that outputs todos like textmate's thing does
;; TODO write an 'insert' todo function that knows about a language's
;; comment symbol
;; TODO, todo function for a directory
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")

(require 'current-buffer-tweaks)
(require 'bindings)
(require 'editing)
(require 'theme)
(require 'my-shell)
(require 'modes)
(require 'auto-modes)

;;(eshell)
(split-window-horizontally)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(ns-toggle-fullscreen)
