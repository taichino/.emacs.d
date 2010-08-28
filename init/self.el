;; Xcode関連
(defun open-in-xcode ()
  (interactive)
  (setq filename (buffer-file-name (current-buffer)))
  (setq offset (format "%d" (point)))
  (call-process "open_in_xcode.py" nil t nil filename offset))
