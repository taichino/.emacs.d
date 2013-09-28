;; (set-language-environment "Japanese")
(prefer-coding-system 'utf-8-unix)
(setq default-buffer-file-coding-system 'utf-8)

;; スタートページは表示しない
(setq inhibit-startup-message t)
;; 音を消す
(setq ring-bell-function 'ignore)
;; 履歴を保存する
(savehist-mode t)
(setq history-length 1000)
;; elisp中で使用できる変数の数
(setq max-specpdl-size 2000)
;; バックアップファイルは作らない
(setq make-backup-files nil)
(setq auto-save-default nil)
;; 現在位置(行, 桁)、時刻表示
(setq line-number-mode t)
(setq column-number-mode t)
;; 対応する括弧を表示
(show-paren-mode t)
;; 選択範囲と検索範囲をハイライト
(setq-default transient-mark-mode t)
(setq search-highlight t)
;; ミニバッファにバッファリストを表示
(iswitchb-mode 1)
;; ツールバーを表示しない
(tool-bar-mode -1)
;; スクロールバーを表示しない
(scroll-bar-mode -1)
;; デフォルト文字コードはUTF-8
(set-default-coding-systems 'utf-8)
;; yes/noの代わりにy/n
(defalias 'yes-or-no-p 'y-or-n-p)
;; diredでの編集機能を追加
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
;; デフォルトのタブ幅
(setq-default tab-width 4)
(setq default-tab-width 4)

;; バッファの扱い
(ffap-bindings)
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")
(setq recentf-max-saved-items 500)
(require 'recentf-ext)

;; yasnippets
(add-to-list 'load-path "~/.emacs.d/lib/lisp/yasnippet")
(require 'yasnippet)
(yas/load-directory "~/.emacs.d/lib/lisp/yasnippet")

