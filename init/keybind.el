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
(global-set-key "\C-cso" 'occur-by-moccur)
(global-set-key "\C-z" nil) 

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