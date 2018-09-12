(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config
  (setf custom-safe-themes t)
  (color-theme-sanityinc-tomorrow-night)
  (global-hl-line-mode 1)
)

(add-hook 'window-setup-hook 'toggle-frame-maximized t)
