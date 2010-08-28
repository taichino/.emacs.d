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


;; as-mode
(require 'applescript-mode)
(setq auto-mode-alist
      (append '(("\\.applescript$" . applescript-mode))
              auto-mode-alist))

;; elisp mode
(require 'auto-async-byte-compile)
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

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
	(setq indent-level 2)
	(setq py-indent-offset 2)
	(setq ipython-command "/usr/local/bin/ipython")
	(require 'ipython)))