(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-executable "ag")
 '(ag-ignore-list (quote ("/vendor/")))
 '(create-lockfiles nil)
 '(css-indent-offset 2)
 '(current-language-environment "ASCII")
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(exec-path
   (quote
    ("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/usr/local/Cellar/emacs-mac/emacs-25.1-rc2-mac-5.91/libexec/emacs/25.1/x86_64-apple-darwin15.6.0" "/usr/local/bin" "~/bin")))
 '(frame-background-mode (quote dark))
 '(global-whitespace-mode nil)
 '(go-guru-build-tags "")
 '(go-guru-scope "orahub.oraclecorp.com/odx-oke-dev/k8s-manager/...,")
 '(go-oracle-command "oracle")
 '(go-play-browse-function (quote browse-url))
 '(ido-ignore-buffers (quote ("ag search" "\\` " "go-guru" "scratch" "helm")))
 '(ido-ignore-files
   (quote
    ("\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./" "\\.test$")))
 '(ido-use-url-at-point t)
 '(indent-tabs-mode t)
 '(js-indent-level 2)
 '(menu-bar-mode nil)
 '(nxml-child-indent 2 t)
 '(package-archives
   (quote
    (("melpa" . "https://melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (protobuf-mode smart-tabs-mode helm helm-ag helm-projectile helm-pt go-guru magit go-autocomplete cl-lib popup go-scratch go-projectile flymake-go flx-ido dockerfile-mode docker company-go color-theme-solarized browse-at-remote ag)))
 '(projectile-completion-system (quote helm))
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "vendor")))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "nil" :slant normal :weight normal :height 161 :width normal)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; List of manual things to load ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; force package initialization
;; http://stackoverflow.com/questions/24610945/emacs-cant-autostart-projectile-installed-through-melpa
(require 'package)
(setq package-enable-at-startup nil) ; To avoid initializing twice
(package-initialize)

(load-theme 'solarized t)

(projectile-global-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; go stuff https://godoc.org/golang.org/x/tools/cmd/goimports
(setq gofmt-command "goimports")
;;(add-to-list 'load-path "/home/you/somewhere/emacs/")
;;(require 'go-mode-load)
(add-hook 'before-save-hook 'gofmt-before-save)

;; http://stackoverflow.com/questions/69934/set-4-space-indent-in-emacs-in-text-mode
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default indent-line-function 'insert-tab)

;; https://www.masteringemacs.org/article/introduction-to-ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)
(setq ido-file-extensions-order '(".go" ".js" ".css" ))


;; put backup files in a specific directory
;; https://www.emacswiki.org/emacs/BackupDirectory#toc1
(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))

;; http://emacsredux.com/blog/2013/04/03/delete-file-and-buffer/
(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (progn
          (delete-file filename)
          (message "Deleted file %s" filename)
          (kill-buffer))))))
;; http://stackoverflow.com/questions/3417438/closing-all-other-buffers-in-emacs
(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer
          (delq (current-buffer)
                (cl-remove-if-not 'buffer-file-name (buffer-list)))))

(global-set-key (kbd "C-c D")  'delete-file-and-buffer)
(global-set-key (kbd "C-c K")  'kill-other-buffers)
(global-set-key (kbd "C-c S")  'helm-do-pt)

;; from flx
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(require 'go-guru)

;; https://github.com/nsf/gocode
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

(require 'helm)

;; fullscreen mode-line-client
;; F11 = Full Screen http://superuser.com/questions/256404/fullscreen-emacs-in-osx
(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
      (if (equal 'fullboth current-value)
        (if (boundp 'old-fullscreen) old-fullscreen nil)
        (progn (setq old-fullscreen current-value)
          'fullboth)))))
(global-set-key [f11] 'toggle-fullscreen)

;; Disable tool-bar
(tool-bar-mode -1)

;; Disable Menu Bar
(menu-bar-mode -1)

;; indentation using smart-tabs-mode
(smart-tabs-insinuate 'nxml 'javascript)
(smart-tabs-advice js2-indent-line js2-basic-offset)


;; nxml-mode
(setq
    nxml-child-indent 4
    nxml-attribute-indent 4
    nxml-slash-auto-complete-flag t)

(add-to-list 'auto-mode-alist '("\\.ino\\'" . c++-mode))

;; https://emacs.stackexchange.com/questions/16469/how-to-merge-git-conflicts-in-emacs
;; use smerge when opening conflicted files
(defun my-enable-smerge-maybe ()
  (when (and buffer-file-name (vc-backend buffer-file-name))
    (save-excursion
      (goto-char (point-min))
      (when (re-search-forward "^<<<<<<< " nil t)
        (smerge-mode +1)))))

(add-hook 'buffer-list-update-hook #'my-enable-smerge-maybe)

;; oracle proxy
;; (setq url-proxy-services
;;       '(("no_proxy" . "^\\(localhost\\|10.*\\)")
;;         ("http" . "http://www-proxy.us.oracle.com:80/")
;;         ("https" . "http://www-proxy.us.oracle.com:80/")))

;; crazy helm stuff
(global-set-key (kbd "M-x") 'helm-M-x)
