;;; -*- lexical-binding: t -*-
;;; Author: 2025-01-01 05:40:23
;;; Time-stamp: <2025-01-01 05:40:23 (ywatanabe)>
;;; File: /home/ywatanabe/.dotfiles/.emacs.d/lisp/llemacs/llemacs.el/02-llemacs-logging/file/02-llemacs-logging-file-viewers.el

;; (require '02-llemacs-logging-core-utils)
;; (require '02-llemacs-logging-file-getters)

(defun llemacs--logging-view-logs-by-level (level)
  "View logs of specified LEVEL in buffer."
  (interactive
   (list (completing-read "Log level: "
                          '("debug" "info" "warn" "error")
                          nil t)))
  (let ((entries (llemacs--logging-get-logs-by-level (intern level))))
    (llemacs--logging-display-buffer llemacs--buffer-logging t)
    (with-current-buffer llemacs--buffer-logging
      ;; (let ((inhibit-read-only t))
      (erase-buffer)
      (dolist (entry entries)
        (insert entry "\n")))))

;; (llemacs--logging-view-logs-by-level "error")

(defun llemacs--logging-view-all-logs ()
  "View all logs in buffer."
  (interactive)
  (let ((entries (llemacs--logging-get-all-logs)))
    (llemacs--logging-display-buffer llemacs--buffer-logging t)
    (with-current-buffer llemacs--buffer-logging
      (let ((inhibit-read-only t))
        (erase-buffer)
        (dolist (entry entries)
          (insert entry "\n"))))))

;; (llemacs--logging-view-all-logs)

(provide '02-llemacs-logging-file-viewers)

(message "%s was loaded." (file-name-nondirectory (or load-file-name buffer-file-name)))