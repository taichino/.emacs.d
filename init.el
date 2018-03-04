(add-to-list 'load-path "~/.emacs.d/inits")

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(add-to-list 'exec-path "/usr/local/bin")

(load "base.el")
(load "display.el")
(load "keybind.el")
(load "memo.el")
(load "programming.el")
