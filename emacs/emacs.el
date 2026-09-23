;;; emacs.el --- Configuration for my emacs

;;; Commentary:
;;; This package provides my customized Emacs configuration.
;;; It is meant to be a lighter Emacs configuration as I enjoy most of the
;;; defaults.
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

;; melpa
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; suppress some irrelevant warnings clojure packages throw
(setq byte-compile-warnings '(not obsolete docstrings lexical cl-functions))
(setq native-comp-async-report-warnings-errors 'silent)
(setq warning-suppress-log-types '((comp) (bytecomp)))

;; Backup dir dumping to ~/.emacs.d/backups instead of in same dir.
;; The veracrypt line is to prevent my encrypted journal from getting
;; dumped to unencrypted space in a backup.
(setq backup-directory-alist
      `(("/media/veracrypt1/" . nil)
	("." . ,(concat user-emacs-directory
                        "backups"))))
(setq auto-save-default nil)

(add-to-list 'default-frame-alist '(width . 85))

;; stops emacs from forcing me to type "yes" instead of hitting "y"
(setq use-short-answers t)

;; shift and arrow keys to navigate windows
(windmove-default-keybindings)

;; line numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; 80 column marker line
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
(setq display-fill-column-indicator-column 80)

;; cursor line highlight
(global-hl-line-mode)

;; enable column numbers
(use-package simple
  :ensure nil
  :config (column-number-mode +1))

;; delete intermediate buffers when navigating dired
(use-package dired
  :ensure nil
  :config
  (setq delete-by-moving-to-trash t)
  (eval-after-load "dired"
    #'(lambda ()
        (put 'dired-find-alternate-file 'disabled nil)
        (define-key dired-mode-map (kbd "RET") #'dired-find-alternate-file))))

(fido-vertical-mode)

(use-package company
  :ensure t
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


;; clojure
(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package clojure-mode
  :ensure t)

(use-package cider
  :ensure t)

(use-package paredit
  :ensure t
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

;; web stuff (js, ts, esx, tsx, etc.)

;; macos font fix
(set-face-attribute 'default nil :height 140)

;; Always follow symlinks.
;; It's not dangerous to follow version controlled
;; symlinks by default now since git doesn't rely
;; on lockfiles like ancient VC systems did.
(setq vc-follow-symlinks t)

;;; emacs.el ends here
