(defun setup-my-keys ()
  (global-set-key (kbd "C-x C-c") 'ask-before-closing)
  (global-set-key (kbd "C-c ;") 'delete-other-windows)
  (global-set-key (kbd "C-c '") 'winner-undo)
  (global-set-key (kbd "C-c \"") 'winner-redo)
  (global-set-key (kbd "C-x m") 'eshell)
  (global-set-key (kbd "C-c g") 'my-find-grep)
  )

(add-hook 'after-init-hook 'setup-my-keys)

(provide 'my-key-bindings)
