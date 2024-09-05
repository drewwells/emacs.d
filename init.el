(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-arguments '("--smart-case" "--stats" "--hidden"))
 '(ag-ignore-list '("/vendor/"))
 '(async-bytecomp-package-mode t)
 '(copilot-indent-offset-warning-disable t)
 '(copilot-max-char -1)
 '(create-lockfiles nil)
 '(current-language-environment "ASCII")
 '(custom-safe-themes
   '("51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "13a8eaddb003fd0d561096e11e1a91b029d3c9d64554f8e897b2513dbf14b277" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))
 '(custom-theme-directory "~/.emacs.d/themes/emacs-color-theme-solarized/")
 '(exec-path
   '("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/usr/local/bin" "~/bin" "/usr/local/go/bin" "~/.cargo/bin"))
 '(frame-background-mode 'dark)
 '(global-whitespace-mode nil)
 '(go-guru-build-tags "")
 '(go-guru-debug t)
 '(gptel-api-key 'gptel-api-key-from-auth-source)
 '(ido-ignore-buffers '("ag search" "\\` "))
 '(ido-ignore-files '("\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./"))
 '(ido-use-url-at-point t)
 '(jenkinsfile-mode-indent-offset 2)
 '(js-indent-level 2)
 '(menu-bar-mode nil)
 '(mode-require-final-newline nil)
 '(nxml-child-indent 2 t)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   '(flycheck-rust rust-mode ethan-wspace copilot flymake-go-staticcheck json-rpc editorconfig quelpa-use-package quelpa flymake flymake-go eglot jenkinsfile-mode company go-mode yasnippet use-package flycheck exec-path-from-shell yaml-mode protobuf-mode smart-tabs-mode helm helm-ag helm-projectile helm-pt magit cl-lib popup flx-ido browse-at-remote ag))
 '(projectile-completion-system 'helm)
 '(projectile-enable-caching t)
 '(projectile-globally-ignored-directories
   '(".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "build"))
 '(projectile-globally-ignored-files '("TAGS"))
 '(projectile-indexing-method 'hybrid)
 '(projectile-mode t nil (projectile))
 '(projectile-project-root-files
   '("dune-project" "Project.toml" "elm.json" "pubspec.yaml" "info.rkt" "Cargo.toml" "stack.yaml" "DESCRIPTION" "Eldev" "Eask" "Cask" "shard.yml" "Gemfile" ".bloop" "deps.edn" "build.boot" "project.clj" "build.sc" "build.sbt" "application.yml" "gradlew" "build.gradle" "pom.xml" "pyproject.toml" "poetry.lock" "Pipfile" "tox.ini" "setup.py" "requirements.txt" "manage.py" "angular.json" "package.json" "gulpfile.js" "Gruntfile.js" "mix.exs" "rebar.config" "composer.json" "Taskfile.yml" "CMakeLists.txt" "GNUMakefile" "Makefile" "debian/control" "WORKSPACE" "flake.nix" "default.nix" "meson.build" "SConstruct" "?*.nimble" "?*.sln" "?*.fsproj" "?*.csproj" "GTAGS" "TAGS" "configure.ac" "configure.in" "cscope.out" "go.mod" ".gitignore"))
 '(projectile-sort-order 'recently-active)
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
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(setq package-enable-at-startup nil) ; To avoid initializing twice
(package-initialize)


;; https://docs.projectile.mx/projectile/installation.html#installation-via-package-el
(unless (package-installed-p 'projectile)
  (package-install 'projectile))

(require 'projectile)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)

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

(require 'rust-mode)
(require 'go-mode)
(require 'eglot)
(add-hook 'go-mode-hook 'eglot-ensure)

;; https://rust-analyzer.github.io/manual.html#eglot
;; (add-hook 'rust-mode-hook 'eglot-ensure)
;; (add-to-list 'eglot-server-programs
;;              '((rust-ts-mode rust-mode) .
;;                ("rust-analyzer" :initializationOptions (:check (:command "clippy")))))

;; https://github.com/rust-lang/rust-mode?tab=readme-ov-file#feature-guide
;; (add-hook 'rust-mode-hook
;;          (lambda () (setq indent-tabs-mode nil)))

;; (setq rust-format-on-save t)

;; (setq-default eglot-workspace-configuration
;;     '((:gopls .
;;         ((staticcheck . t)
;;          (matcher . "CaseSensitive")))))

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

;; https://stackoverflow.com/a/30900018/217965
(setq vc-follow-symlinks t)

(use-package ethan-wspace
  :ensure t
  :config
  (setq mode-require-final-newline nil)
  (global-ethan-wspace-mode 1))

;; https://github.com/quelpa/quelpa/pull/104/files#diff-b335630551682c19a781afebcf4d07bf978fb1f8ac04c6bf87428ed5106870f5R256
(setq quelpa-checkout-melpa-p nil)

(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://github.com/quelpa/quelpa/raw/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))

(quelpa
 '(quelpa-use-package
   :fetcher git
   :url "https://github.com/quelpa/quelpa-use-package.git"))

(require 'quelpa-use-package)


;; https://github.com/copilot-emacs/copilot.el
(use-package copilot
  :quelpa (copilot :fetcher github
                   :repo "copilot-emacs/copilot.el"
                   :branch "main"
                   :files ("*.el"))

  :bind (("C-c M-f" . copilot-complete)
         :map copilot-completion-map
         ("C-g" . 'copilot-clear-overlay)
         ("M-p" . 'copilot-previous-completion)
         ("M-n" . 'copilot-next-completion)
         ("<tab>" . 'copilot-accept-completion)
         ("TAB" . 'copilot-accept-completion)
         ("M-f" . 'copilot-accept-completion-by-word)
         ("M-RET" . 'copilot-accept-completion-by-line)
         ))


;; you can utilize :map :hook and :config to customize copilot
(add-hook 'prog-mode-hook 'copilot-mode)

;;(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
;;(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; https://github.com/sellout/emacs-color-theme-solarized#installation--usage
(add-to-list 'load-path "~/.emacs.d/themes/emacs-color-theme-solarized/")
;;(load-theme 'solarized t)
;; ChatGPT manual application of fonts

(defun my-solarized-light-colors ()
  (set-face-attribute 'default nil :foreground "#839496") ; Default text color (base0)
  (set-face-foreground 'font-lock-comment-face "#586e75") ; Comments (base01)
  (set-face-foreground 'font-lock-string-face "#2aa198")  ; Strings (cyan)
  (set-face-foreground 'font-lock-keyword-face "#859900") ; Keywords (green)
  (set-face-foreground 'font-lock-function-name-face "#268bd2") ; Function names (blue)
  (set-face-foreground 'font-lock-variable-name-face "#b58900") ; Variables (yellow)
  (set-face-foreground 'font-lock-type-face "#268bd2") ; Types (blue)
  (set-face-foreground 'font-lock-constant-face "#d33682") ; Constants (magenta)
  (set-face-foreground 'font-lock-builtin-face "#6c71c4") ; Built-in functions (violet)
  (set-face-foreground 'font-lock-warning-face "#dc322f")) ; Warnings (red)

(defun my-solarized-dark-colors ()
  (set-face-attribute 'default nil :foreground "#839496") ; Default text color (base0)
  (set-face-foreground 'font-lock-comment-face "#93a1a1") ; Comments (base01)
  (set-face-foreground 'font-lock-string-face "#2aa198")  ; Strings (cyan)
  (set-face-foreground 'font-lock-keyword-face "#b58900") ; Keywords (yellow)
  (set-face-foreground 'font-lock-function-name-face "#268bd2") ; Function names (blue)
  (set-face-foreground 'font-lock-variable-name-face "#859900") ; Variables (green)
  (set-face-foreground 'font-lock-type-face "#b58900") ; Types (yellow)
  (set-face-foreground 'font-lock-constant-face "#6c71c4") ; Constants (violet)
  (set-face-foreground 'font-lock-builtin-face "#cb4b16") ; Built-in functions (orange)
  (set-face-foreground 'font-lock-warning-face "#dc322f")) ; Warnings (red)

(defun my-toggle-solarized-colors ()
  (if (eq frame-background-mode 'dark)
      (my-solarized-dark-colors)
    (my-solarized-light-colors)))

;; Hook this function to be called whenever the frame background mode changes
(add-hook 'after-make-frame-functions (lambda (frame)
                                        (with-selected-frame frame
                                          (my-toggle-solarized-colors))))

;; Call the function immediately to apply the colors to the current frame
(my-toggle-solarized-colors)

(add-hook 'emacs-startup-hook 'my-toggle-solarized-colors)

(defun my-toggle-frame-background-mode ()
  (interactive)
  (if (eq frame-background-mode 'dark)
      (progn
        (setq frame-background-mode 'light)
        (my-solarized-light-colors))
    (progn
      (setq frame-background-mode 'dark)
      (my-solarized-dark-colors)))
  (frame-set-background-mode nil))  ; Apply the new mode

(global-set-key (kbd "C-c t") 'my-toggle-frame-background-mode) ; Bind to a key, e.g., Ctrl-c t



;; Editorconfig
(editorconfig-mode 1)

;; (add-hook 'go-mode-hook #'flymake-go-staticcheck-enable)
;; (add-hook 'go-mode-hook #'flymake-mode)

;; Chatgpt recommendations for invalidating projectile cache
;;(add-hook 'after-save-hook 'projectile-invalidate-cache nil t)
;;(add-hook 'projectile-switch-project-hook 'projectile-invalidate-cache)

;; Add custom file extensions to trigger makefile-mode
(add-to-list 'auto-mode-alist '("\\Makefile\\.[^/\\]*\\'" . makefile-mode))
