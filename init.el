(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/lib/lisp")
(add-to-list 'load-path "~/.emacs.d/lib/lisp/apel")
(add-to-list 'load-path "~/.emacs.d/lib/lisp/emu")
(add-to-list 'load-path "~/.emacs.d/lib/lisp/howm")

;; auto-install
(require 'auto-install)
(add-to-list 'load-path auto-install-directory)
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

(load "init/base.el")
(load "init/display.el")
(load "init/keybind.el")
(load "init/memo.el")
(load "init/programming.el")
(load "init/self.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
