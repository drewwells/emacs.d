(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-ignore-list '("/vendor/"))
 '(create-lockfiles nil)
 '(current-language-environment "ASCII")
 '(custom-safe-themes
   '("51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "13a8eaddb003fd0d561096e11e1a91b029d3c9d64554f8e897b2513dbf14b277" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))
 '(exec-path
   '("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/usr/local/bin" "~/bin" "/usr/local/go/bin"))
 '(frame-background-mode 'dark)
 '(global-whitespace-mode nil)
 '(go-guru-build-tags "")
 '(go-guru-debug t)
 '(go-play-browse-function 'browse-url)
 '(ido-ignore-buffers '("ag search" "\\` " "go-guru" "scratch" "helm"))
 '(ido-ignore-files
   '("\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./" "\\.test$"))
 '(ido-use-url-at-point t)
 '(js-indent-level 2)
 '(menu-bar-mode nil)
 '(nxml-child-indent 2 t)
 '(package-archives
   '(("melpa" . "https://melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/")))
 '(package-enable-at-startup nil)
 '(package-selected-packages
   '(flymake flymake-go eglot jenkinsfile-mode company go-mode yasnippet use-package flycheck exec-path-from-shell yaml-mode protobuf-mode smart-tabs-mode helm helm-ag helm-projectile helm-pt magit cl-lib popup flx-ido browse-at-remote ag))
 '(projectile-completion-system 'helm)
 '(projectile-globally-ignored-directories
   '(".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" ".stack-work"))
 '(tool-bar-mode nil))

;; https://github.com/Wilfred/ag.el/issues/93#issuecomment-348003505
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; List of manual things to load ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; https://www.reddit.com/r/emacs/comments/4j828f/til_setq_gcconsthreshold_100000000/
(setq gc-cons-threshold 200000000)

;; https://emacs-lsp.github.io/lsp-mode/page/performance/#increase-the-amount-of-data-which-emacs-reads-from-the-process
(setq read-process-output-max (* 1024 1024)) ;; 1mb

;; force package initialization
;; http://stackoverflow.com/questions/24610945/emacs-cant-autostart-projectile-installed-through-melpa
(require 'package)
(setq package-enable-at-startup nil) ; To avoid initializing twice
(package-initialize)

(require 'projectile)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; save backups in a backup directory
;; https://stackoverflow.com/a/151946/217965
(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; disabled, conflicts with pls-mode
;; go stuff https://godoc.org/golang.org/x/tools/cmd/goimports
;; (setq gofmt-command "goimports")

;; (add-hook 'before-save-hook 'gofmt-before-save)

;; http://stackoverflow.com/questions/69934/set-4-space-indent-in-emacs-in-text-mode
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default indent-line-function 'insert-tab)

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

(global-set-key (kbd "C-c D")  'delete-file-and-buffer)

;; http://stackoverflow.com/questions/3417438/closing-all-other-buffers-in-emacs
(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer
          (delq (current-buffer)
                (cl-remove-if-not 'buffer-file-name (buffer-list)))))

(global-set-key (kbd "C-c K")  'kill-other-buffers)

;; from flx
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(require 'helm)

;; Disable tool-bar
(tool-bar-mode -1)

;; Disable Menu Bar
(menu-bar-mode -1)

;; https://company-mode.github.io/
(add-hook 'after-init-hook 'global-company-mode)


;; https://github.com/golang/tools/blob/master/gopls/doc/emacs.md
(require 'project)

(defun project-find-go-module (dir)
  (when-let ((root (locate-dominating-file dir "go.mod")))
    (cons 'go-module root)))

(cl-defmethod project-root ((project (head go-module)))
  (cdr project))

(add-hook 'project-find-functions #'project-find-go-module)

;; Optional: load other packages before eglot to enable eglot integrations.
(require 'company)
(require 'yasnippet)

(require 'go-mode)
(require 'eglot)
(add-hook 'go-mode-hook 'eglot-ensure)

(setq-default eglot-workspace-configuration
    '((:gopls .
        ((staticcheck . t)
         (matcher . "CaseSensitive")))))

;; https://github.com/joaotavora/eglot/issues/574#issuecomment-1249316625
  (defun own/eglot-organize-imports ()
    (call-interactively 'eglot-code-action-organize-imports))
  (defun own/before-saving-go ()
    ;; you might also like:
    (add-hook 'before-save-hook #'eglot-format-buffer -10 t)
    (add-hook 'before-save-hook #'own/eglot-organize-imports nil t))
  (add-hook 'go-mode-hook #'own/before-saving-go)

;; bar-browse is awesome
(global-set-key (kbd "C-c g g") 'browse-at-remote-kill)
