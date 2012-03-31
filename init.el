;; ロードパス
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/lisp/apel")
(add-to-list 'load-path "~/.emacs.d/lisp/emu")
(add-to-list 'load-path "~/.emacs.d/lisp/howm")

;; 実行パス
(add-to-list 'exec-path "/usr/local/bin")

;; auto-install
(require 'auto-install)
(add-to-list 'load-path auto-install-directory)
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

;; 基本設定
(load "init/base.el")

;; 表示、window関連の設定
(load "init/display.el")

;; global-set-key
(load "init/keybind.el")

;; howm/org
(load "init/memo.el")

;; 各種プログラミング用メジャーモード
(load "init/programming.el")

;; 自分で追加した関数など
(load "init/self.el")
