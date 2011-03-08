(add-to-list 'load-path
             (expand-file-name  "~/.emacs.d/tcrayford/"))

(require 'defuns)

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")

(require 'modes)
(require 'current-buffer-tweaks)
(require 'bindings)
(require 'editing)
(require 'theme)
(require 'my-shell)
(require 'auto-modes)

(ns-toggle-fullscreen)
(split-window-vertically)
(split-window-horizontally)
(split-window-horizontally)
(balance-windows)

