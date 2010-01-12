(add-to-list 'load-path "~/.emacs.d/vendor/textmate.el")
(require 'textmate)
(textmate-mode t)
(setq show-trailing-whitespace (not buffer-read-only))

(vendor 'textmate)
(vendor 'nav)
(vendor 'centered-cursor-mode)
(vendor 'browse-kill-ring)
(vendor 'full-ack)
(vendor 'mo-git-blame)
(require 'fastnav)
(require 'browse-kill-ring+)
(browse-kill-ring-default-keybindings)



(provide 'modes)