;; パッケージ
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

;; ロードパス
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp/apel")
(add-to-list 'load-path "~/.emacs.d/site-lisp/emu")
(add-to-list 'load-path "~/.emacs.d/site-lisp/howm")

;; 実行パス
(add-to-list 'exec-path "/usr/local/bin")

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
