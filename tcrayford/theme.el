(require 'color-theme)
(load-file "~/.emacs.d/elpa-to-submit/railscasts.el")
(color-theme-railscasts)
(set-cursor-color "red")
(setq ido-enable-flex-matching t)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\M-W" 'kill-region)

(defface hl-line '((t (:background "black")))
  "Face to use for `hl-line-face'." :group 'hl-line)
(setq hl-line-face 'hl-line)
(global-hl-line-mode t); turn it on for all modes by default
(setq-default cursor-type 'bar)

(set-default-font
 "-apple-inconsolata-medium-r-normal--15-*-72-72-m-150-iso10646-1")
(setq visible-cursor nil)
(blink-cursor-mode t)
(add-to-list 'default-frame-alist '(cursor-type . 'bar))
(setq mac-allow-anti-aliasing t)
(setq cursor-type 'bar)
(provide 'theme)