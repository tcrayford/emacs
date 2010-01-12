(require 'color-theme)
(load-file "~/.emacs.d/elpa-to-submit/railscasts.el")
(color-theme-railscasts)

(setq ido-enable-flex-matching t)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\M-W" 'kill-region)

(custom-set-faces
 '(flymake-errline ((t :underline "red")))
 '(flymake-warnline ((t :underline "green"))))


(defface hl-line '((t (:background "#black")))
  "Face to use for `hl-line-face'." :group 'hl-line)
(setq hl-line-face 'hl-line)
(global-hl-line-mode nil); turn it on for all modes by default

(set-default-font
 "-apple-inconsolata-medium-r-normal--15-*-72-72-m-150-iso10646-1")

(blink-cursor-mode nil)
(setq mac-allow-anti-aliasing t)
(setq-default cursor-type 'box)
(provide 'theme)
