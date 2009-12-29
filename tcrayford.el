(add-to-list 'load-path (expand-file-name  "~/.emacs.d/tcrayford/"))
(require 'current-buffer-tweaks)
(require 'defuns)
;; TODO write some ido stuff using defunkt's ido
;; Maybe for university stuff?
;; TODO write a function that outputs todos like textmate's thing does
;; TODO write an 'insert' todo function that knows about a language's
;; comment symbol
;; TODO, todo function for a directory

(require 'bindings)
(require 'editing)
(require 'theme)
(require 'my-shell)
(require 'modes)
(require 'auto-modes)

;;(eshell)
(split-window-horizontally)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(fs)
