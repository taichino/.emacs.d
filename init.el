(add-to-list 'load-path "~/.emacs.d")

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
