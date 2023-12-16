(defvar my/emacs-dir user-emacs-directory "The path to the currently loaded .emacs.d directory. Must end with a slash.")

(org-babel-load-file
 (expand-file-name
  "readme.org"
  my/emacs-dir))
