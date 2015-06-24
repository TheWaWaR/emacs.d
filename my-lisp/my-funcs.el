(defun my-find-grep (command-args)
  (interactive
   (progn
     (grep-compute-defaults)
     (setq file-regx (read-string "File regx: "))
     (setq str-regx (read-string "String regx: "))
     (setq my-grep-find-command
           (format "find . -type f \\( -name \"%s\" \\) -exec egrep -nH -e \"%s\" {} +"
                   file-regx str-regx))
     (if my-grep-find-command
         (list (read-shell-command "Run find (like this): "
                                   my-grep-find-command 'grep-find-history))
       ;; No default was set
       (read-string
        "compile.el: No `grep-find-command' command available. Press RET.")
       (list nil))))
  (when command-args
    (let ((null-device nil))            ; see grep
      (grep command-args))))

(defun ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
      (save-buffers-kill-emacs))
  (message "Canceled exit"))


;;;; Eshell 命令绑定
;; cls 清屏
(defun eshell/cls ()
  "to clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

;; 打开文件
(defun eshell/em (&rest files)
  (let ((the-files (if (listp (car files))
                       (car files)
                     files)))
    (eshell-printn (format "Edit: %S" the-files))
    (while the-files (find-file (pop the-files)))))

(provide 'my-funcs)
