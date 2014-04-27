(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/lib/lisp")
(add-to-list 'load-path "~/.emacs.d/lib/lisp/apel")
(add-to-list 'load-path "~/.emacs.d/lib/lisp/emu")
(add-to-list 'load-path "~/.emacs.d/lib/lisp/howm")
(add-to-list 'load-path "~/.emacs.d/site-lisp/ess/lisp")

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(defvar is-mac (or (eq window-system 'mac) (featurep 'ns)))

(set-language-environment  'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8-unix)
(cond
 (is-mac
  (require 'ucs-normalize)
  (setq file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs)
  )
 (t
  (setq file-name-coding-system 'utf-8)
  (setq locale-coding-system 'utf-8)
  )
 )

;; 実行パス
(add-to-list 'exec-path "/usr/local/bin")

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
