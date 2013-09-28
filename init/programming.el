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


;; as-mode
(require 'applescript-mode)
(setq auto-mode-alist
      (append '(("\\.applescript$" . applescript-mode))
              auto-mode-alist))

;; apple script
(autoload 'applescript-mode "applescript-mode")
(setq auto-mode-alist
	  (append '(("\.applescript$". applescript-mode))
			  auto-mode-alist))

;; for plagger
(require 'yaml-mode)
(setq auto-mode-alist
      (append '(("\\.yaml$" . yaml-mode))
              auto-mode-alist))
(add-hook 'yaml-mode-hook
      '(lambda ()
        (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; mmm-mode
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

;; ruby
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


;; prolog
(add-hook 'prolog-mode-hook
 '(lambda()
	(setq indent-tabs-mode nil)
	(setq indent-level 4)))
(setq auto-mode-alist
      (append '(("\.plg$". prolog-mode))
	      auto-mode-alist))

;; cmake
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists.txt". cmake-mode))
	      auto-mode-alist))
(setq auto-mode-alist
      (append '(("\.cmake$". cmake-mode))
	      auto-mode-alist))


;; less-css
(setq auto-mode-alist
      (append '(("\.less$". css-mode))
	      auto-mode-alist))

;; js
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js2-mode-hook
          '(lambda()
            (hs-minor-mode 1)))

;; coffee-script
(autoload 'coffee-mode "coffee-mode" "Major mode for editing CoffeeScript." t)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

;; markdown
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;; action script
(require 'actionscript-mode)
(setq auto-mode-alist
      (append '(("\\.as$" . actionscript-mode))
              auto-mode-alist))


;; コードの折りたたみ
(define-key global-map (kbd "C-\\") 'hs-toggle-hiding) 
