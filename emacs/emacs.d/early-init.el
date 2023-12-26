;;; early-init.el --- Pre-initialize customization

;;; Commentary:
;;; Early initialization configuration.
;;; I don't mess with my GC like everyone else does so this file
;;; is only used to suppress warnings.

;;; Code:

(setq byte-compile-warnings '(not obsolete))
(setq warning-suppress-log-types '((comp) (bytecomp)))
(setq native-comp-async-report-warnings-errors 'silent)

;;; early-init.el ends here
