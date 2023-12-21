;; improve startup time by pausing garbage collection during init
(setq gc-cons-threshold most-positive-fixnum)

(setq byte-compile-warnings '(not obsolete))
(setq warning-suppress-log-types '((comp) (bytecomp)))
(setq native-comp-async-report-warnings-errors 'silent)
;;; early-init.el ends here
