;;; helm-texdoc.el --- Helm interface for texdoc
;;
;; Author: Taichi Uemura <t.uemura00@gmail.com>
;; Version: 0.1
;; Package-Requires: (helm)
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

(require 'helm)
(require 'helm-source)
(require 'helm-types)

(defun helm-texdoc-candidates ()
  (apply #'start-process
         "texdoc-list" nil "texdoc"
         "-M" "-l"
         (split-string helm-pattern " " t)))

(defun helm-texdoc-display-to-real (candidate)
  (nth 2 (split-string candidate "\t")))

(defvar helm-source-texdoc
  (helm-build-async-source "texdoc"
    :candidates-process #'helm-texdoc-candidates
    :display-to-real #'helm-texdoc-display-to-real
    :requires-pattern t
    :action 'helm-type-file-actions))

;;;###autoload
(defun helm-texdoc ()
  "Preconfigured `helm' for `texdoc'."
  (interactive)
  (helm :sources helm-source-texdoc
        :buffer "*helm-texdoc*"))

(provide 'helm-texdoc)

;;; helm-texdoc.el ends here.
