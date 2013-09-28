(add-to-list 'auto-mode-alist '("\\.howm$" . howm-mode))
(setq howm-view-title-header "*")
(setq howm-prefix "\C-z")
(setq howm-directory "~/howm")

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
(setq howm-menu-refresh-after-save nil) ;; メモ保存時のメニュー更新も止める

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
