;; init.el --- MinEmacs core initialization file -*- lexical-binding: t; -*-

;; PERF: Setting `file-name-handler-alist' to nil should boost startup time.
;; reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start
;; Store the current value so we can reset it after Emacs startup.
(put 'file-name-handler-alist 'original-value (default-toplevel-value 'file-name-handler-alist))
;; Make sure the new value survives any current let-binding.
(set-default-toplevel-value 'file-name-handler-alist nil)
;; After Emacs startup, we restore `file-name-handler-alist' while conserving
;; the potential edits made during startup.
(add-hook
 'emacs-startup-hook
 (defun +mineamcs--restore-file-name-handler-alist-h ()
   (setq file-name-handler-alist
         (delete-dups (append file-name-handler-alist
                              (get 'file-name-handler-alist 'original-value)))))
 100)

(defvar my/emacs-dir user-emacs-directory "The path to the currently loaded .emacs.d directory. Must end with a slash.")
(org-babel-load-file
 (expand-file-name
  "readme.org"
  my/emacs-dir))
