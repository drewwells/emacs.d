;;; flymake-go-staticcheck-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "flymake-go-staticcheck" "flymake-go-staticcheck.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from flymake-go-staticcheck.el

(autoload 'flymake-go-staticcheck-checker "flymake-go-staticcheck" "\
Run go-staticcheck on the current buffer.
Report results using FLYMAKE-REPORT-FN.  All other parameters are currently IGNORED.

\(fn FLYMAKE-REPORT-FN &rest IGNORED)" nil nil)

(autoload 'flymake-go-staticcheck-enable "flymake-go-staticcheck" "\
Add flymake-go-staticcheck as a buffer-local Flymake backend." t nil)

(autoload 'flymake-go-staticcheck-disable "flymake-go-staticcheck" "\
Remove flymake-go-staticcheck from Flymake backends." t nil)

(register-definition-prefixes "flymake-go-staticcheck" '("flymake-go-staticcheck-"))

;;;***

;;;### (autoloads nil nil ("flymake-go-staticcheck-pkg.el") (0 0
;;;;;;  0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; flymake-go-staticcheck-autoloads.el ends here
