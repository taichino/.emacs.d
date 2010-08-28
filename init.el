;; ロードパス
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/lisp/apel")
(add-to-list 'load-path "~/.emacs.d/lisp/emu")
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
;; 実行パス
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/opt/local/bin")

;; auto-install
(require 'auto-install)
(add-to-list 'load-path auto-install-directory)
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

;; color theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-arjen)

;; キーバインド
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\C-cg" 'grep)
(global-set-key "\C-cc" 'compile)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-xp" (lambda () (interactive) (other-window -1)))
(global-set-key "\M-N" 'next-error)
(global-set-key "\M-P" 'previous-error)
(global-set-key "\M-r" 'replace-string)

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

;; 音を消す
(setq ring-bell-function 'ignore)

;; 翻訳
(require 'text-translator)
(setq text-translator-auto-selection-func
      'text-translator-translate-by-auto-selection-enja)

;; yasnippets
(add-to-list 'load-path "~/.emacs.d/lisp/yasnippet")
(require 'yasnippet-config)
(yas/setup "~/.emacs.d/lisp/yasnippet")

;; 履歴を保存する
(savehist-mode t)
(setq history-length 1000)
;; elisp中で使用できる変数の数
(setq max-specpdl-size 2000)
;; バックアップファイルは作らない
(setq make-backup-files nil)
;; 現在位置(行, 桁)、時刻表示
(setq line-number-mode t)
(setq column-number-mode t)

;; 対応する括弧を表示
(show-paren-mode t)
;; 対応する括弧へjump
(progn
  (defvar com-point nil
    "Remember com point as a marker. \(buffer specific\)")
  (set-default 'com-point (make-marker))
  (defun getcom (arg)
    "Get com part of prefix-argument ARG."
    (cond ((null arg) nil)
          ((consp arg) (cdr arg))
          (t nil)))
  (defun paren-match (arg)
    "Go to the matching parenthesis."
    (interactive "P")
    (let ((com (getcom arg)))
      (if (numberp arg)
          (if (or (> arg 99) (< arg 1))
              (error "Prefix must be between 1 and 99.")
            (goto-char
             (if (> (point-max) 80000)
                 (* (/ (point-max) 100) arg)
               (/ (* (point-max) arg) 100)))
            (back-to-indentation))
        (cond ((looking-at "[\(\[{]")
               (if com (move-marker com-point (point)))
               (forward-sexp 1)
               (if com
                   (paren-match nil com)
                 (backward-char)))
              ((looking-at "[])]}")
               (forward-char)
               (if com (move-marker com-point (point)))
               (backward-sexp 1)
               (if com (paren-match nil com)))
              (t (error ""))))))
  (define-key ctl-x-map "%" 'paren-match))

;; 選択範囲をハイライト
(setq-default transient-mark-mode t)
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

;; migemo
;; (setq-default case-fold-search nil)
;; (require 'migemo)
;; (setq migemo-use-pattern-alist t)
;; (setq migemo-use-frequent-pattern-alist t)

(when (eq system-type 'darwin)
  (setq my-font "-*-*-medium-r-normal--12-*-*-*-*-*-fontset-osaka")
;;  (setq fixed-width-use-QuickDraw-for-ascii t)
  (setq mac-allow-anti-aliasing t)
  (if (= emacs-major-version 22)
      (require 'carbon-font))
  (set-default-font my-font)
  (add-to-list 'default-frame-alist `(font . ,my-font))
  (when (= emacs-major-version 23)
    (set-fontset-font
     (frame-parameter nil 'font)
     'japanese-jisx0208
     '("osaka" . "iso10646-1"))
    (setq face-font-rescale-alist
	  '(("^-apple-hiragino.*" . 1.2)
	    (".*osaka-bold.*" . 1.2)
  	    (".*osaka-medium.*" . 1.2)
  	    (".*courier-bold-.*-mac-roman" . 1.0)
  	    (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
  	    (".*monaco-bold-.*-mac-roman" . 0.9)
  	    ("-cdac$" . 1.3)))))

;; emacsclient
(server-start)
(global-set-key (kbd "C-x C-c") 'server-edit)
(defalias 'exit 'save-buffers-kill-emacs)

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

;; windowのtoggle
(defun window-toggle-division ()
  "ウィンドウ 2 分割時に、縦分割<->横分割"
  (interactive)
  (unless (= (count-windows 1) 2)
    (error "ウィンドウが 2 分割されていません。"))
  (let (before-height (other-buf (window-buffer (next-window))))
    (setq before-height (window-height))
    (delete-other-windows)

    (if (= (window-height) before-height)
        (split-window-vertically)
      (split-window-horizontally))
    (switch-to-buffer-other-window other-buf)
    (other-window -1)))

;; 画面切替
(defun swap-screen()
  "Swap two screen,leaving cursor at current window."
  (interactive)
  (let ((thiswin (selected-window))
        (nextbuf (window-buffer (next-window))))
    (set-window-buffer (next-window) (window-buffer))
    (set-window-buffer thiswin nextbuf)))
(defun swap-screen-with-cursor()
  "Swap two screen,with cursor in same buffer."
  (interactive)
  (let ((thiswin (selected-window))
        (thisbuf (window-buffer)))
    (other-window 1)
    (set-window-buffer thiswin (window-buffer))
    (set-window-buffer (selected-window) thisbuf)))
(global-set-key "\C-xwt" 'swap-screen)
(global-set-key "\C-xwT" 'swap-screen-with-cursor)

;; カーソルを元の位置へ
(require 'point-undo)
(global-set-key "\M--" 'point-undo)

;; objc-mode
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@implementation" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@interface" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@protocol" . objc-mode))
(setq ff-other-file-alist
     '(("\\.mm?$" (".h"))
       ("\\.cc$"  (".hh" ".h"))
       ("\\.hh$"  (".cc" ".C"))

       ("\\.c$"   (".h"))
       ("\\.h$"   (".c" ".cc" ".C" ".CC" ".cxx" ".cpp" ".m" ".mm"))

       ("\\.C$"   (".H"  ".hh" ".h"))
       ("\\.H$"   (".C"  ".CC"))

       ("\\.CC$"  (".HH" ".H"  ".hh" ".h"))
       ("\\.HH$"  (".CC"))

       ("\\.cxx$" (".hh" ".h"))
       ("\\.cpp$" (".hpp" ".hh" ".h"))

       ("\\.hpp$" (".cpp" ".c"))))
(add-hook 'objc-mode-hook
         (lambda ()
           (define-key c-mode-base-map (kbd "C-c o") 'ff-find-other-file)))

;;
;; as-mode
;;
(require 'applescript-mode)
(setq auto-mode-alist
      (append '(("\\.applescript$" . applescript-mode))
              auto-mode-alist))


;; elscreen
(setq elscreen-prefix-key "\C-t")
(load "elscreen" "ElScreen" t)
(define-key elscreen-map [(control space)] [(control @)])
(define-key elscreen-map "\C-@" 'elscreen-next)
(define-key elscreen-map [?\C-\ ] 'elscreen-next)
(define-key elscreen-map "@" 'elscreen-next)
(define-key elscreen-map [?\ ] 'elscreen-next)

;; Xcode関連
(defun open-in-xcode ()
  (interactive)
  (setq filename (buffer-file-name (current-buffer)))
  (setq offset (format "%d" (point)))
  (call-process "open_in_xcode.py" nil t nil filename offset))

;; elisp mode
(require 'auto-async-byte-compile)
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; apple script
(autoload 'applescript-mode "applescript-mode")
(setq auto-mode-alist
	  (append '(("\.applescript$". applescript-mode))
			  auto-mode-alist))


;; howm
(setq howm-menu-lang 'ja)
(global-set-key "\C-c,," 'howm-menu)
(mapc
 (lambda (f)
   (autoload f
     "howm" "Hitori Otegaru Wiki Modoki" t))
 '(howm-menu howm-list-all howm-list-recent
             howm-list-grep howm-create
             howm-keyword-to-kill-ring))
(eval-after-load "howm-mode"
  '(progn
     (define-key howm-mode-map [tab] 'action-lock-goto-next-link)
     (define-key howm-mode-map [(meta tab)] 'action-lock-goto-previous-link)))
(setq howm-list-recent-title t)
(setq howm-list-all-title t)
(setq howm-menu-expiry-hours 2)

(add-hook 'howm-mode-on-hook 'auto-fill-mode)
(setq howm-view-summary-persistent nil)

(setq howm-menu-schedule-days-before 10)
(setq howm-menu-schedule-days 3)

(setq howm-file-name-format "%Y/%m/%Y-%m-%d.howm")
(setq howm-view-grep-parse-line
      "^\\(\\([a-zA-Z]:/\\)?[^:]*\\.howm\\):\\([0-9]*\\):\\(.*\\)$")
(if (not (memq 'delete-file-if-no-contents after-save-hook))
    (setq after-save-hook
          (cons 'delete-file-if-no-contents after-save-hook)))
(defun delete-file-if-no-contents ()
  (when (and
         (buffer-file-name (current-buffer))
         (string-match "\\.howm" (buffer-file-name (current-buffer)))
         (= (point-min) (point-max)))
    (delete-file
     (buffer-file-name (current-buffer)))))
(defun my-save-and-kill-buffer ()
  (interactive)
  (when (and
         (buffer-file-name)
         (string-match "\\.howm"
                       (buffer-file-name)))
    (save-buffer)
    (kill-buffer nil)))
(eval-after-load "howm"
  '(progn
     (define-key howm-mode-map
       "\C-c\C-c" 'my-save-and-kill-buffer)))

;; anything
(require 'anything-startup)
(anything-complete-shell-history-setup-key (kbd "C-o"))

;;
;; for plagger
;;
(require 'yaml-mode)
(setq auto-mode-alist
      (append '(("\\.yaml$" . yaml-mode))
              auto-mode-alist))
(add-hook 'yaml-mode-hook
      '(lambda ()
        (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;;
;; mmm-mode
;;
(require 'mmm-mode)
(setq mmm-global-mode 'maybe)
(set-face-background 'mmm-default-submode-face "#333333")
(mmm-add-classes
 '(
   (mmm-css-mode
    :submode css-mode
    :front "<style[^>]*>[^<]"
	:back "\n?[ \t]*</style>"
    )
   (mmm-javascript-mode
    :submode javascript-mode
    :front "<script[^>]*>[^<]"
    :back "\n?[ \t]*</script>"
    )
   (mmm-django-mode
    :submode django-mode
    :front "{[{|%]"
    :back "\n?[ \t]*[}|%]}"
    )
   ))
(mmm-add-mode-ext-class 'html-mode nil 'mmm-css-mode)
(mmm-add-mode-ext-class 'html-mode nil 'mmm-javascript-mode)
(mmm-add-mode-ext-class 'html-mode nil 'mmm-django-mode)


;;
;; gnu global
;;
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

;;
;; for ruby
;;
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
          '(lambda ()
            (inf-ruby-keys)))

;;
;; for python
;;
(add-hook 'python-mode-hook
 '(lambda()
	(setq indent-tabs-mode nil)
	(setq indent-level 2)
	(setq py-indent-offset 2)
	(setq ipython-command "/usr/local/bin/ipython")
	(require 'ipython)))


;; git
(add-to-list 'load-path "~/.emacs.d/lisp/magit/share/emacs/site-lisp")
(require 'magit)

