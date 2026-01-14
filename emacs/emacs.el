;;; emacs.el --- Configuration for my emacs

;;; Commentary:
;;; This package provides my customized Emacs configuration.
;;; It is meant to be a lighter Emacs configuration as I enjoy most of the defaults.
;;; Personal Documentation:
;;; Figured I would start this personal documentation section to
;;; ensure that I have one offline spot to view my reminders on some
;;; key emacs commands that I constantly forget due to inconsistent
;;; use.
;;; Lookup docs for var: C-h v <var>
;;; Find keybinding: C-h w <command>
;;; View all keybindings: C-h b
;;; Page through commands: C-x [pause for a sec] C-h n
;;; Then C-h n to keep paging

;;; Code:

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Emacs can automatically create backup files. This tells Emacs to
;; put all backups in ~/.emacs.d/backups. More info:
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Files.html
;; If in my veracrypt mount, just put the backups in the same dir again.
(setq backup-directory-alist
      `(("/media/veracrypt1/" . nil)
	("." . ,(concat user-emacs-directory
                        "backups"))))
(setq auto-save-default nil)

(add-to-list 'default-frame-alist '(width . 85))

;; Change all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; Enable moving around windows instead of only cycling through them
(global-set-key (kbd "<C-M-up>")    'windmove-up)
(global-set-key (kbd "<C-M-down>")  'windmove-down)
(global-set-key (kbd "<C-M-left>")  'windmove-left)
(global-set-key (kbd "<C-M-right>") 'windmove-right)

;; Setup line numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Turn on 80 column marker
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; Highlight cursor line
(global-hl-line-mode)

;; Setting up the package manager. Install if missing.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t))

;; enable column numbers
(use-package simple
  :ensure nil
  :config (column-number-mode +1))

(use-package eldoc
  :ensure nil
  :diminish eldoc-mode
  :config
  (setq eldoc-idle-delay 0.4))

(use-package paren
  :ensure nil
  :init (setq show-paren-delay 0)
  :config (show-paren-mode +1))

;; delete intermediate buffers when navigating dired
(use-package dired
  :ensure nil
  :config
  (setq delete-by-moving-to-trash t)
  (eval-after-load "dired"
    #'(lambda ()
        (put 'dired-find-alternate-file 'disabled nil)
        (define-key dired-mode-map (kbd "RET") #'dired-find-alternate-file))))

(use-package ido
  :config
  (ido-mode +1)
  (setq ido-everywhere t
        ido-enable-flex-matching t))

(use-package ido-vertical-mode
  :config
  (ido-vertical-mode +1)
  (setq ido-vertical-define-keys 'C-n-C-p-up-and-down))

(use-package ido-completing-read+
  :config (ido-ubiquitous-mode +1))

(use-package flx-ido
  :config (flx-ido-mode +1))

(use-package company
  :diminish company-mode
  :hook (prog-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.1
        company-selection-wrap-around t
        company-tooltip-align-annotations t
        company-frontends '(company-pseudo-tooltip-frontend ; show tooltip even for single candidate
                            company-echo-metadata-frontend))
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

(use-package flycheck
  :config (global-flycheck-mode +1))

(use-package go-mode)

(use-package geiser)
(use-package geiser-mit)
(use-package paredit)
(use-package macrostep)

(use-package macrostep-geiser
  :after geiser-mode
  :config (add-hook 'geiser-mode-hook #'macrostep-geiser-setup))

(use-package macrostep-geiser
  :after geiser-repl
  :config (add-hook 'geiser-repl-mode-hook #'macrostep-geiser-setup))

(use-package slime
  :after (slime-setup '(slime-fancy slime-quicklisp slime-asdf)))

;; Some other themes I liked: bubbleberry-theme forest-blue-theme
;; autumn-light-theme afternoon-theme soft-morning-theme acme-theme

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package clojure-mode
  :ensure t)

(use-package cider
  :ensure t)

(use-package paredit
  :after (clojure-mode)
  :config
  (autoload 'enable-paredit-mode "paredit"
    "Turn on pseudo-structural editing of Lisp code."
    t)
  (add-hook 'emacs-lisp-mode-hook       'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           'enable-paredit-mode)
  (add-hook 'clojure-mode-hook               'enable-paredit-mode))

;; lsp-java quick start
(condition-case nil
    (require 'use-package)
  (file-error
   (require 'package)
   (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
   (package-initialize)
   (package-refresh-contents)
   (package-install 'use-package)
   (setq use-package-always-ensure t)
   (require 'use-package)))
(use-package projectile)
(use-package flycheck)
(use-package yasnippet :config (yas-global-mode))
(use-package lsp-mode
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :init (setq lsp-keymap-prefix "s-k"))
(use-package hydra)
(use-package company)
(use-package lsp-ui)
(use-package which-key :config (which-key-mode))
(use-package lsp-java :config (add-hook 'java-mode-hook 'lsp))
(use-package dap-mode :after lsp-mode :config (dap-auto-configure-mode))
(use-package dap-java :ensure nil)
(use-package lsp-treemacs)

;; Always follow symlinks
;; It's not dangerous to follow version controlled
;; symlinks by default now since git doesn't rely
;; on lockfiles like ancient VC systems did
(setq vc-follow-symlinks t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(byte-compile-warnings '(not obsolete))
 '(display-fill-column-indicator-column 80)
 '(native-comp-async-report-warnings-errors 'silent)
 '(package-selected-packages nil)
 '(warning-supress-log-types '((comp) (bytecomp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; emacs.el ends here
