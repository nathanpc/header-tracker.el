;;; header-tracker.el --- Easy switching between header and source files.

;; Copyright (C) 2019 Nathan Campos

;; Author: Nathan Campos <nathan@innoveworkshop.com>
;; Homepage: http://github.com/nathanpc/header-tracker.el
;; Version: 1.0.0
;; Keywords: convenience, usability
;; Package-Requires: ((emacs "24.1"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Quickly and easily keep track and switch between header and source files
;; using this handy package.

;; This package exports a interactive function `header-tracker-toggle-header`
;; which can be binded to a key to seamlessly switch between source and header
;; files.  This can be accomplished by adding the following lines to your
;; configuration file:

;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             (local-set-key (kbd "C-c h") 'header-tracker-toggle-header)))

;; For more information about this package please consult the README file.

;;; Code:

(defun header-tracker-toggle-header ()
  "Toggle between source and a header file."
  (interactive)
  (setq filename (buffer-file-name))
  (setq filename (if (string-match "cp?" (file-name-extension filename))
					 (progn
					   (setq newfile (concat (file-name-sans-extension filename) ".h"))
					   (if (file-exists-p newfile)
						   newfile
						 (replace-regexp-in-string "\/src\/" "/include/" newfile)))
				   (progn
					 (setq newfile (replace-regexp-in-string "\/include\/" "/src/" filename))
					 (setq newfile (concat (file-name-sans-extension newfile) ".c"))
					 (if (file-exists-p newfile)
						 newfile
					   (concat (file-name-sans-extension newfile) ".cpp")))))
  (if (file-exists-p filename)
	  (find-file filename)
	(error (concat "Header or source file that you tried to switch to doesn't exist: " filename))))

(provide 'header-tracker)
;;; header-tracker.el ends here
