;; 文字コード
(set-language-environment "Japanese")
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

;; emacsclient
(server-start)
(global-set-key (kbd "C-x C-c") 'server-edit)
(defalias 'exit 'save-buffers-kill-emacs)

;; sequential-command
(require 'sequential-command-config)
(sequential-command-setup-keys)

;; grep-edit
(require 'grep-edit)

;; shell
(require 'shell-history)
(require 'eshell)
(setq eshell-save-history-on-exit nil)
(setq eshell-history-file-name "~/.zsh_history")

;; summarye.el
(require 'summarye)

;; バッファの扱い
(ffap-bindings)
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")
(setq recentf-max-saved-items 500)
(require 'recentf-ext)

;; color-moccur
(require 'color-moccur)
(require 'moccur-edit)
(setq moccur-split-word t)

;; カーソルを元の位置へ
(require 'point-undo)
(global-set-key "\M--" 'point-undo)

;; migemo
(setq migemo-command "migemo")
(setq migemo-options '("-t" "emacs"))
(setq migemo-dictionary (expand-file-name "~/.emacs.d/share/migemo/migemo-dict"))
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setenv "RUBYLIB" "~/.emacs.d/lib/ruby/site_ruby/")
(require 'migemo)

;; anything
(require 'anything-startup)
(anything-complete-shell-history-setup-key (kbd "C-o"))

;; gnu global
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
      '(lambda ()
         (local-set-key "\M-t" 'gtags-find-tag)
         (local-set-key "\M-r" 'gtags-find-rtag)
         (local-set-key "\M-s" 'gtags-find-symbol)
         (local-set-key "\C-t" 'gtags-pop-stack)
         ))
(add-hook 'c-mode-common-hook
          '(lambda()
             (gtags-mode 1)
             (gtags-make-complete-list)
             ))

;; git
(add-to-list 'load-path "~/.emacs.d/lisp/magit/share/emacs/site-lisp")
(require 'magit)

;; twitter
(require 'twittering-mode)

;; view mode
(require 'viewer)
(setq view-read-only t)
(setq viewer-modeline-color-view "orange")
(viewer-change-modeline-color-setup)

;; auto-complete
(require 'auto-complete-config)
(global-auto-complete-mode 1)

;; 翻訳
(require 'text-translator)
(setq text-translator-auto-selection-func
      'text-translator-translate-by-auto-selection-enja)

;; yasnippets
(add-to-list 'load-path "~/.emacs.d/lisp/yasnippet")
(require 'yasnippet-config)
(yas/setup "~/.emacs.d/lisp/yasnippet")
