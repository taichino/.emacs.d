;; color theme
(require 'color-theme)
(color-theme-initialize)
(load-theme 'deeper-blue t)

(custom-set-variables '(initial-frame-alist (quote ((fullscreen . maximized)))))

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
(global-set-key "\C-cwt" 'window-toggle-division)

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
(global-set-key "\C-cws" 'swap-screen)
(global-set-key "\C-cwS" 'swap-screen-with-cursor)

;;; フレームサイズをトグルで切り替え
(setq my-frame-max-flag nil)
(defun my-toggle-frame-size ()
  (interactive)
  (if my-frame-max-flag
      (progn
        (setq my-frame-max-flag nil)
        (if (functionp 'w32-restore-frame)
            (w32-restore-frame)
          (set-frame-configuration my-last-frame-conf)
          (message "not MAX.") (sit-for 2)
          ))
    (setq my-frame-max-flag t)
    (if (functionp 'w32-maximize-frame)
        (w32-maximize-frame)
      (setq my-last-frame-conf (current-frame-configuration))
      (set-frame-position (selected-frame) 0 0)
      ;; フレーム最大化時に (frame-height) で得た値
      (set-frame-height (selected-frame) 59)
      ;; フレーム最大化時に (frame-width) で得た値
      (set-frame-width (selected-frame) 171)
      (message "to MAX.") (sit-for 2)
    )))

;; バッファ移動にShift+カーソルを使えるようにする
(windmove-default-keybindings)

;; elscreen
(setq elscreen-prefix-key "\C-t")
(load "elscreen" "ElScreen" t)
(define-key elscreen-map [(control space)] [(control @)])
(define-key elscreen-map "\C-@" 'elscreen-next)
(define-key elscreen-map [?\C-\ ] 'elscreen-next)
(define-key elscreen-map "@" 'elscreen-next)
(define-key elscreen-map [?\ ] 'elscreen-next)
