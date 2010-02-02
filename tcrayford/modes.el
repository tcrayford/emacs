(vendor 'centered-cursor-mode)
(vendor 'browse-kill-ring)
(vendor 'mo-git-blame)
(vendor 'smooth-scrolling)
(require 'smooth-scrolling)
(require 'fastnav)
(require 'browse-kill-ring+)
(browse-kill-ring-default-keybindings)
(yas/global-mode t)
(yas/minor-mode t)
(vendor 'thingatp)
(yas/minor-mode t)
(textmate-mode t)
(smart-tab-mode t)

;;ack
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)

;;clojure
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))

(add-to-list 'load-path "~/.emacs.d/vendor/")
(add-hook 'slime-load-hook (lambda () (require 'slime-company)))

(vendor 'dot-mode)
(dot-mode-on)
(vendor 'smex)
(require 'smex)
(add-hook 'after-init-hook 'smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(load "~/.emacs.d/vendor/haskell/haskell-site-file.el")

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; Dired
(require 'dired)

;; remap 'o' in dired mode to open a file
(defun dired-open-mac ()
  (interactive)
  (let ((file-name (dired-get-file-for-visit)))
    (if (file-exists-p file-name)
        (call-process "/usr/bin/open" nil 0 nil file-name))))
(define-key dired-mode-map "o" 'dired-open-mac)

;; - is `cd ..` (like vim)
(define-key dired-mode-map "-" 'dired-up-directory)

;; prefer dired over dumping dir list to buffer
(global-set-key "\C-x\C-d" 'dired)



(provide 'modes)
