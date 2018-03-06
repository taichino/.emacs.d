(setq howm-view-title-header "*") ;; ← howm のロードより前に書くこと
(use-package howm
  :ensure t
  :bind* ("C-c , ," . howm-menu)
  :config
 
  ;; howm のメモを置くディレクトリ
  (setq howm-directory "~/Dropbox/howm")

  (setq howm-menu-lang 'en)
)
