;; magit
(package-activate 'magit '(1 1 1))
(eval-after-load 'magit
  '(progn
     (set-face-background 'magit-item-highlight "#202020")
     (set-face-foreground 'magit-diff-add "#40ff40")
     (set-face-foreground 'magit-diff-del "#ff4040")
     (set-face-foreground 'magit-diff-file-header "#4040ff")))

;; objc-mode
(setq ff-search-directories '("./" "../*" "../../*"))
(add-to-list 'auto-mode-alist '("\\.mm?$" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . objc-mode))
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
			(c-set-style "cc-mode")
			(setq c-indent-level 4)
			(setq c-tab-width 4)
			(setq tab-width 4)
			(define-key c-mode-base-map (kbd "C-c o") 'ff-find-other-file)))


;; ruby
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(add-hook 'ruby-mode-hook
          (lambda ()
            (define-key ruby-mode-map "{" nil)
            (define-key ruby-mode-map "}" nil)))

;; python
(add-hook 'python-mode-hook
 '(lambda()
	(setq indent-tabs-mode nil)
	(setq indent-level 4)
	(setq py-indent-offset 4)
	(setq ipython-command "/usr/local/bin/ipython")
	(require 'ipython)))

;; c++
(add-hook 'c++-mode-hook
		  '(lambda()	
			 (setq indent-tabs-mode nil)
			 (c-set-style "cc-mode")
			 (setq c-indent-level 4)
			 (setq c-tab-width 4)
			 (setq tab-width 4)
			 (setq c-basic-offset tab-width)))
(add-hook 'c-mode-hook
		  '(lambda()	
			 (setq indent-tabs-mode nil)
			 (c-set-style "cc-mode")
			 (setq c-indent-level 4)
			 (setq c-tab-width 4)
			 (setq tab-width 4)
			 (setq c-basic-offset tab-width)))

;; swift
(use-package swift-mode
  :ensure t)
