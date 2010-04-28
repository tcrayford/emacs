(require 'color-theme)
(load-file "~/.emacs.d/tcrayford/grb.el")
(color-theme-grb)

(setq ido-enable-flex-matching t)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\M-W" 'kill-region)

(defface hl-line '((t (:background "black")))
  "Face to use for `hl-line-face'." :group 'hl-line)
(setq hl-line-face 'hl-line)


(global-hl-line-mode t)

(set-default-font
 "-apple-inconsolata-medium-r-normal--16-140-72-72-m-140-iso10646-1")

(blink-cursor-mode t)
(setq mac-allow-anti-aliasing t)
(setq-default cursor-type 'box)

(setq ring-bell-function
      (lambda ()
	(unless (memq this-command
		      '(isearch-abort abort-recursive-edit exit-minibuffer keyboard-quit))
	  (ding))))

(custom-set-faces
 '(flymake-errline ((t :underline "red")))
 '(flymake-warnline ((t :underline "orange"))))
(provide 'theme)
