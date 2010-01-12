;; Railscasts color theme for Emacs.
;;
;; To use add the following to your .emacs file:
;;
;;
;; MIT License Copyright (c) 2009 Oleg Shaldybin <oleg.shaldybin@gmail.com>
;; Inspired by the brilliant Railscasts theme for TextMate
;;

(defun color-theme-railscasts ()
  (interactive)
  (color-theme-install
   '(color-theme-railscasts
     ((background-color . "#1c1c1c")
      (background-mode . dark)
      (cursor-color . "#997200")
      (foreground-color . "#efe9d2"))
     (default ((t (nil))))
     (bold ((t (:bold t))))
     (bold-italic ((t (:italic t :bold t))))
     (fringe ((t (:background "#232323"))))
     (font-lock-builtin-face ((t (:foreground "#ddaaaa"))))
     (font-lock-number-face ((t (:foreground "#D28BC8"))))
     (font-lock-comment-face ((t (:foreground "#808080" :italic t))))
     (font-lock-constant-face ((t (:foreground "#808080"))))
     (font-lock-doc-string-face ((t (:foreground "#92CF8"))))
     (font-lock-function-name-face ((t (:foreground "#daba94"))))
     (font-lock-keyword-face ((t (:foreground "#678fbf"))))
     (font-lock-preprocessor-face ((t (:foreground "#df8787"))))
     (font-lock-reference-face ((t (:foreground "#df8787"))))
     (font-lock-string-face ((t (:foreground "#8ad06a"))))
     (font-lock-type-face ((t (:foreground "white"))))
     (font-lock-variable-name-face ((t (:foreground "#df8787"))))
     (font-lock-warning-face ((t (:foreground "Pink"))))
     (show-paren-match-face ((t (:foreground "black" :background "#aaaacc"))))
     (highlight ((t (:background "darkolivegreen"))))
     (italic ((t (:italic t))))
     (modeline ((t (:background "#B6B6B6" :foreground "black"))))
     (modeline-buffer-id ((t (:background "#B6b6b6" :foreground
                                          "black"))))
     (modeline-mousable ((t (:background "#A5BAF1" :foreground
                                         "black"))))
     (modeline-mousable-minor-mode ((t (:background
                                        "#A5BAF1" :foreground "black"))))
     (region ((t (:background "#3f4e6e"))))
     (primary-selection ((t (:background "#555577"))))
     (isearch ((t (:background "#555555"))))
     (zmacs-region ((t (:background "#555577"))))
     (secondary-selection ((t (:background "darkslateblue"))))
     (flymake-errline ((t (:background "LightSalmon" :foreground
                                       "black"))))
     (flymake-warnline ((t (:background "LightSteelBlue" :foreground
                                        "black"))))
     (underline ((t (:underline t))))
     (minibuffer-prompt ((t (:bold t :foreground "#FF6600")))))))