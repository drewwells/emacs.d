;;; helm-ag-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "helm-ag" "helm-ag.el" (0 0 0 0))
;;; Generated autoloads from helm-ag.el

(autoload 'helm-ag-pop-stack "helm-ag" "\
Restore the previous search context from the `helm-ag--context-stack'." t nil)

(autoload 'helm-ag-clear-stack "helm-ag" "\
Clear all entries in the `helm-ag--context-stack'." t nil)

(autoload 'helm-ag-this-file "helm-ag" "\
Do ag with in this file with QUERY.

\(fn &optional QUERY)" t nil)

(autoload 'helm-ag "helm-ag" "\
Do ag with in BASEDIR and with QUERY.

\(fn &optional BASEDIR QUERY)" t nil)

(autoload 'helm-do-ag-this-file "helm-ag" "\
Execute `helm-do-ag' Search in the current file.

\(fn &optional QUERY)" t nil)

(autoload 'helm-do-ag "helm-ag" "\
Execute a `helm-do-ag' search in the specified directory or files.

BASEDIR: An optional directory in which to perform the search. If not
specified, the current directory is used.
TARGETS: A list of files or directories to search. If not provided,
  the user will be prompted to select files.
DEFAULT-INPUT: An optional string that serves as the initial input for
  the search.

The function initializes the helm state, determines the default directory
and target, and sets up the helm source for searching. It handles Windows
specific behavior for path arguments and saves the current context for
subsequent searches.

\(fn &optional BASEDIR TARGETS DEFAULT-INPUT)" t nil)

(autoload 'helm-ag-project-root "helm-ag" "\
Execute `helm-ag' in the project directory with optional default input QUERY.

\(fn &optional QUERY)" t nil)

(autoload 'helm-do-ag-project-root "helm-ag" "\
Execute `helm-do-ag' in the project directory with optional default input QUERY..

\(fn &optional QUERY)" t nil)

(autoload 'helm-ag-buffers "helm-ag" "\
Execute `helm-ag' in all buffers with optional default input QUERY.

\(fn &optional QUERY)" t nil)

(autoload 'helm-do-ag-buffers "helm-ag" "\
Execute `helm-do-ag' in all buffers with optional default input QUERY.

\(fn &optional QUERY)" t nil)

(register-definition-prefixes "helm-ag" '("helm-"))

;;;***

;;;### (autoloads nil nil ("helm-ag-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; helm-ag-autoloads.el ends here
