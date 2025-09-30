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
   '("5aedf993c7220cbbe66a410334239521d8ba91e1815f6ebde59cecc2355d7757" "8363207a952efb78e917230f5a4d3326b2916c63237c1f61d7e5fe07def8d378" "18a1d83b4e16993189749494d75e6adb0e15452c80c431aca4a867bcc8890ca9" "51fa6edfd6c8a4defc2681e4c438caf24908854c12ea12a1fbfd4d055a9647a3" "0517759e6b71f4ad76d8d38b69c51a5c2f7196675d202e3c2507124980c3c2a3" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "13a8eaddb003fd0d561096e11e1a91b029d3c9d64554f8e897b2513dbf14b277" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))
 '(exec-path
   '("/home/drew/.local/share/mise/shims/" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/usr/local/bin" "~/bin" "/usr/local/go/bin" "~/.cargo/bin"))
 '(global-whitespace-mode nil)
 '(go-guru-build-tags "")
 '(gptel-api-key 'gptel-api-key-from-auth-source)
 '(ido-ignore-buffers '("ag search" "\\` "))
 '(ido-ignore-files '("\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./"))
 '(ido-use-url-at-point t)
 '(jenkinsfile-mode-indent-offset 2)
 '(js-indent-level 2)
 '(menu-bar-mode nil)
 '(nxml-child-indent 2 t)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   '(gruvbox-theme lsp-mode rustic flycheck-rust rust-mode ethan-wspace copilot flymake-go-staticcheck json-rpc editorconfig quelpa-use-package quelpa flymake eglot jenkinsfile-mode company go-mode yasnippet use-package flycheck exec-path-from-shell yaml-mode protobuf-mode smart-tabs-mode helm helm-ag helm-projectile helm-pt magit cl-lib popup flx-ido browse-at-remote ag))
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

;; CLI tools installed by Mise
;; https://mise.jdx.dev/ide-integration.html#emacs
(setenv "PATH" (concat (getenv "PATH") ":~/.local/share/mise/shims"))
(setq exec-path (append exec-path '("~/.local/share/mise/shims")))

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
(setq gofmt-command "goimports")

(add-hook 'before-save-hook 'gofmt-before-save)

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

;; (require 'rust-mode)
(require 'go-mode)
(require 'eglot)
(add-hook 'go-mode-hook 'eglot-ensure)


(use-package rust-mode
  :ensure t
  :config
  ;; Automatically format before saving
  (add-hook 'rust-mode-hook
            (lambda () (add-hook 'before-save-hook #'rust-format-buffer nil t))))

(use-package eglot
  :ensure t
  :hook (rust-mode . eglot-ensure))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode t))


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

(load-theme 'gruvbox-dark-soft)

;; you can utilize :map :hook and :config to customize copilot
(add-hook 'prog-mode-hook 'copilot-mode)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Editorconfig
(editorconfig-mode 1)

;; Add custom file extensions to trigger makefile-mode
(add-to-list 'auto-mode-alist '("\\Makefile\\.[^/\\]*\\'" . makefile-mode))

;; Fix annoying vertical window splitting.
;; https://lists.gnu.org/archive/html/help-gnu-emacs/2015-08/msg00339.html
(with-eval-after-load "window"
  (defcustom split-window-below nil
    "If non-nil, vertical splits produce new windows below."
    :group 'windows
    :type 'boolean)

  (defcustom split-window-right nil
    "If non-nil, horizontal splits produce new windows to the right."
    :group 'windows
    :type 'boolean)

  (fmakunbound #'split-window-sensibly)

  (defun split-window-sensibly
      (&optional window)
    (setq window (or window (selected-window)))
    (or (and (window-splittable-p window t)
             ;; Split window horizontally.
             (split-window window nil (if split-window-right 'left  'right)))
        (and (window-splittable-p window)
             ;; Split window vertically.
             (split-window window nil (if split-window-below 'above 'below)))
        (and (eq window (frame-root-window (window-frame window)))
             (not (window-minibuffer-p window))
             ;; If WINDOW is the only window on its frame and is not the
             ;; minibuffer window, try to split it horizontally disregarding the
             ;; value of `split-width-threshold'.
             (let ((split-width-threshold 0))
               (when (window-splittable-p window t)
                 (split-window window nil (if split-window-right
                                              'left
                                            'right))))))))

;; Rust mode, turn off if not using
;; https://github.com/emacs-rustic/rustic?tab=readme-ov-file#remote

;; (use-package rustic
;;   :quelpa (rustic :fetcher github :repo "emacs-rustic/rustic")
;;   :init
;;   (setq rustic-lsp-client 'eglot          ;; Use eglot as the LSP client
;;         rustic-format-on-save t           ;; Automatically format on save
;;         rustic-compile-command "cargo build") ;; Default compile command
;;   :config
;;   ;; Ensure eglot does not show inlay hints
;;   (with-eval-after-load 'eglot
;;     ;; Disable eglot inlay hints globally
;;     (add-hook 'eglot-managed-mode-hook
;;               (lambda ()
;;                 (when (derived-mode-p 'rustic-mode)
;;                   (eglot-inlay-hints-mode -1))))))

;; (setq flymake-fringe-indicator-position 'left-fringe)


;; (defun my-eglot-flymake-no-margin ()
;;   (setq left-margin-width 0)
;;   (set-window-buffer (selected-window) (current-buffer)))

;; (add-hook 'flymake-mode-hook #'my-eglot-flymake-no-margin)
