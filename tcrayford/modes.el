(vendor 'textmate)
(vendor 'nav)
(vendor 'centered-cursor-mode)
(vendor 'browse-kill-ring)
(vendor 'full-ack)
(vendor 'mo-git-blame)
(vendor 'smooth-scrolling)
(require 'smooth-scrolling)
(require 'fastnav)
(require 'browse-kill-ring+)
(browse-kill-ring-default-keybindings)
(yas/global-mode)
(yas/minor-mode t)
(textmate-mode t)
(smart-tab-mode t)
;ack
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)

;clojure
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))



(provide 'modes)