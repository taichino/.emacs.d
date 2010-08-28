;; ロードパス
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/lisp/apel")
(add-to-list 'load-path "~/.emacs.d/lisp/emu")
(add-to-list 'load-path "~/.emacs.d/lisp/howm")

;; 実行パス
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/opt/local/bin")

;; auto-install
(require 'auto-install)
(add-to-list 'load-path auto-install-directory)
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

;; 初期化ファイルはinitディレクトリ下のファイル群
(load "init/base.el")
(load "init/keybind.el")
(load "init/display.el")
(load "init/memo.el")
(load "init/programming.el")
(load "init/self.el")
