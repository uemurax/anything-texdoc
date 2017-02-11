;;; anything-texdoc.el --- Anything interface for texdoc
;;
;; Author: Taichi Uemura <t.uemura00@gmail.com>
;; Version: 0.1
;; Package-Requires: (anything)
;; License: GPL3
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;
;;; Code:

(require 'anything)

(defun anything-texdoc-candidates ()
  (apply #'start-process
         "texdoc-list" nil "texdoc"
         "-M" "-l"
         (split-string anything-pattern " " t)))

(defun anything-texdoc-display-to-real (candidate)
  (nth 2 (split-string candidate "\t")))

(defvar anything-c-source-texdoc
  '((name . "texdoc")
    (candidates . anything-texdoc-candidates)
    (requires-pattern)
    (display-to-real . anything-texdoc-display-to-real)
    (type . file)))

;;;###autoload
(defun anything-texdoc ()
  "Preconfigured `anything' for `texdoc'."
  (interactive)
  (anything-other-buffer anything-c-source-texdoc "*anything-texdoc*"))

(provide 'anything-texdoc)

;;; anything-texdoc.el ends here.
