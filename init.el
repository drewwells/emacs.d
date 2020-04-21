(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-ignore-list (quote ("/vendor/")))
 '(create-lockfiles nil)
 '(current-language-environment "ASCII")
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(exec-path
   (quote
    ("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/usr/local/bin" "~/bin" "/usr/local/go/bin")))
 '(frame-background-mode (quote dark))
 '(global-whitespace-mode nil)
 '(go-guru-build-tags "")
 '(go-guru-debug t)
 '(go-play-browse-function (quote browse-url))
 '(ido-ignore-buffers (quote ("ag search" "\\` " "go-guru" "scratch" "helm")))
 '(ido-ignore-files
   (quote
    ("\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./" "\\.test$")))
 '(ido-use-url-at-point t)
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
    (company-go flycheck lsp-ui company-lsp lsp-mode exec-path-from-shell go-autocomplete yaml-mode protobuf-mode smart-tabs-mode helm helm-ag helm-projectile helm-pt go-guru magit cl-lib popup go-scratch go-projectile flymake-go flx-ido dockerfile-mode docker color-theme-solarized browse-at-remote ag)))
 '(projectile-completion-system (quote helm))
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "vendor")))
 '(solarized-bold t)
 '(solarized-broken-srgb nil)
 '(solarized-degrade nil)
 '(solarized-termcolors 16)
 '(solarized-underline t)
 '(tool-bar-mode nil))

;; https://github.com/Wilfred/ag.el/issues/93#issuecomment-348003505
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "nil" :slant normal :weight normal :height 161 :width normal)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; List of manual things to load ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; https://github.com/mdempsky/gocode
(add-to-list 'load-path "~/.emacs.d/lisp/")
;;(require 'go-autocomplete)
;;(require 'auto-complete-config)
;;(ac-config-default)


;; force package initialization
;; http://stackoverflow.com/questions/24610945/emacs-cant-autostart-projectile-installed-through-melpa
(require 'package)
(setq package-enable-at-startup nil) ; To avoid initializing twice
(package-initialize)

;;(load-theme 'solarized t)

(require 'projectile)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; go stuff https://godoc.org/golang.org/x/tools/cmd/goimports
(setq gofmt-command "goimports")

(add-hook 'before-save-hook 'gofmt-before-save)

;; http://stackoverflow.com/questions/69934/set-4-space-indent-in-emacs-in-text-mode
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default indent-line-function 'insert-tab)

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

(require 'go-guru)

(require 'helm)

;; Disable tool-bar
(tool-bar-mode -1)

;; Disable Menu Bar
(menu-bar-mode -1)

;; gopls
;; https://arenzana.org/2019/12/emacs-go-mode-revisited/
(setq lsp-gopls-staticcheck t)
(setq lsp-eldoc-render-all t)
(setq lsp-gopls-complete-unimported t)

;;Set up before-save hooks to format buffer and add/delete imports.
;;Make sure you don't have other gofmt/goimports hooks enabled.

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;;lsp-ui-doc-enable is false because I don't like the popover that shows up on the right
;;I'll change it if I want it back


(setq lsp-ui-doc-enable nil
      lsp-ui-peek-enable t
      lsp-ui-sideline-enable t
      lsp-ui-imenu-enable t
      lsp-ui-flycheck-enable t)

;; bar-browse is awesome
(global-set-key (kbd "C-c g g") 'browse-at-remote-kill)
