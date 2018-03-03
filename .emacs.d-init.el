;; set up package management
(require 'package)
(dolist (pkg '(("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
               ("melpa" . "http://melpa.milkbox.net/packages/")
               ("marmalade" . "http://marmalade-repo.org/packages/")))
  (add-to-list 'package-archives pkg t))

(package-initialize)

(dolist (p '(color-theme auto-complete magit flycheck clojure-mode
                         paredit cider restclient go-mode yaml-mode markdown-mode))
  (when (not (package-installed-p p))
    (package-install p)))

;; tabs off by default
(setq-default indent-tabs-mode nil)
;; remove emacs splash screen
(setq inhibit-splash-screen t)
;; ido mode settings
(ido-mode 1)
(setq ido-enable-flex-matching t)
;; ignore case for tab completion
(set-variable 'read-file-name-completion-ignore-case t)
;; find and grep commands
(set-variable 'grep-command "grep -nri -e ")
(set-variable 'grep-find-command
              (concat "find . -not -path '*.svn*' -not -path '*.git*' -type f -print0 | "
                      "xargs -0 grep -in -e "))
;; turn some modes off
(dolist (mode '(tool-bar-mode menu-bar-mode scroll-bar-mode blink-cursor-mode))
  (when (functionp mode)
    (funcall mode 0)))
;; this has emacs use unique names based on location
;; instead of appending numbers
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)
;; highlight extraneous whitespace
(setq-default show-trailing-whitespace t)
;; set modes for some zope files
(require 'sgml-mode)
(dolist (mode-pair '(("\\.zcml$" . xml-mode)
                     ("\\.pt$" . xml-mode)
                     ("\\.mako$" . html-mode)))
  (add-to-list 'auto-mode-alist mode-pair))
;; auto indent next line
(global-set-key "\C-m" 'newline-and-indent)
;; add pdb keystroke for python files
(fset 'pdb-break "import pdb; pdb.set_trace();\C-a\C-i")
(add-hook 'python-mode-hook
          #'(lambda ()
              (local-set-key [(meta ?p) (meta ?p)] 'pdb-break)))
;; have emacs shell work with ls colors
(add-hook 'shell-mode-hook
          'ansi-color-for-comint-mode-on)
;; create backups in ~/tmp/emacs
(when (not (file-directory-p "~/tmp/emacs"))
  (make-directory "~/tmp/emacs" t))
(setq backup-directory-alist '(("." . "~/tmp/emacs")))
;; set up emacs color theme
(require 'color-theme)
(when (functionp 'color-theme-initialize)
  (color-theme-initialize))
(color-theme-dark-laptop)
;; (color-theme-retro-green)
;; add auto complete
(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1")
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
;(ac-flyspell-workaround)

(global-auto-complete-mode t)
;; (setq ac-auto-show-menu t)
(setq ac-auto-show-menu nil)
(setq ac-auto-start nil)
(setq ac-dwim t)
;; (setq ac-use-menu-map t)
(setq ac-quick-help-delay 1)
(setq ac-quick-help-height 60)

(set-default 'ac-sources
             '(ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-words-in-all-buffer))

(dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode haml-mode
                sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                html-mode nxml-mode sh-mode smarty-mode clojure-mode
                lisp-mode textile-mode markdown-mode tuareg-mode go-mode))
  (add-to-list 'ac-modes mode))

;;Key triggers
(ac-set-trigger-key "TAB")
;; (define-key ac-completing-map (kbd "C-M-n") 'ac-next)
;; (define-key ac-completing-map (kbd "C-M-p") 'ac-previous)
(define-key ac-completing-map "\t" 'ac-complete)
(define-key ac-completing-map "\r" nil)

(require 'magit)

(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
                         (if (equal 'fullboth current-value)
                             (if (boundp 'old-fullscreen) old-fullscreen nil)
                           (progn (setq old-fullscreen current-value)
                                  'fullboth)))))
(global-set-key [f11] 'toggle-fullscreen)
; Make new frames fullscreen by default. Note: this hook doesn't do
; anything to the initial frame if it's in your .emacs, since that file is
; read _after_ the initial frame is created.
(add-hook 'after-make-frame-functions 'toggle-fullscreen)

;; (add-hook 'after-init-hook #'global-flycheck-mode)
(dolist (mode-hook '(python-mode-hook go-mode-hook c-mode-hook))
  (add-hook mode-hook (lambda () (flycheck-mode t))))

(add-hook 'go-mode-hook
      (lambda ()
        (setq indent-tabs-mode t)
        (setq tab-width 2)
        (add-hook 'before-save-hook #'gofmt-before-save)))

(require 'saveplace)
(setq-default save-place t)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(global-set-key (kbd "C-x g") 'magit-status)

(setq compilation-read-command nil)
(global-set-key (kbd "C-x c") 'compile)

(defun insert-heading-line-below (string-to-insert)
  (let ((line-length (length (buffer-substring-no-properties
                              (line-beginning-position) (line-end-position)))))
    (insert "\n")
    (dotimes (_ line-length)
      (insert string-to-insert))
    (insert "\n")))

(global-set-key (kbd "C-c m 1") #'(lambda () (interactive) (insert-heading-line-below "=")))
(global-set-key (kbd "C-c m 2") #'(lambda () (interactive) (insert-heading-line-below "-")))

(show-paren-mode 1)

(setq
 c-default-style "linux"
 c-basic-offset 4
 indent-tabs-mode nil)

(dolist (mode '(restclient yaml-mode markdown-mode))
  (require mode))

(setq js-indent-level 2)

;; maybe do this conditionally?
;; or do we have to check if these paths exist first?
(add-hook 'c-mode-hook
          (lambda ()
            (let* ((clang-include-paths '("~/opt/include"
                                          "~/opt/usr/local/include"
                                          "/usr/include/glib-2.0"
                                          "/usr/lib/x86_64-linux-gnu/glib-2.0/include"
                                          "/usr/include/json-c"))
                   (clang-include-paths-full (mapcar #'expand-file-name clang-include-paths))
                   (clang-include-paths-exists (remove-if-not #'file-directory-p
                                                              clang-include-paths-full)))
              (when clang-include-paths-exists
                (setq flycheck-clang-include-path clang-include-paths-exists
                      flycheck-gcc-include-path clang-include-paths-exists)))))

(let ((h (getenv "HOME")))
  (setenv "PKG_CONFIG_PATH" (concat h "/opt/lib/pkgconfig"))
  (setenv "LD_LIBRARY_PATH"
          (concat (concat h "/opt/lib:")
                  (concat h "/opt/usr/local/lib")))
  (setenv "GOPATH" (concat h "/dev/go/gopath"))
  ;; (setenv "PATH" (concat h "/opt/bin:" (getenv "PATH")))
  )

;; ubuntu specific, but increase font size
(set-default-font "-DAMA-Ubuntu Mono-normal-normal-normal-*-20-*-*-*-m-0-iso10646-1")
