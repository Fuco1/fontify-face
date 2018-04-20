;;; fontify-face.el --- Fontify symbols representing faces with that face. -*- lexical-binding: t -*-

;; Copyright (C) 2018 Matúš Goljer

;; Author: Matúš Goljer <matus.goljer@gmail.com>
;; Maintainer: Matúš Goljer <matus.goljer@gmail.com>
;; Version: 1.0.0
;; Created: 10th April 2018
;; URL: https://github.com/Fuco1/fontify-face
;; Package-requires: ((emacs "24"))
;; Keywords: faces

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Fontify symbols representing faces with that face.

;; See https://github.com/Fuco1/fontify-face

;;; Code:

(defun fontify-face-colorize-matched-face ()
  "Return face for fontifying the last match.

The face used to fontify the region is the text of the matched
region if it represents a face, no face is returned."
  (let ((match (match-string 0)))
    (when (facep match) match)))

(defun fontify-face-find-next-symbol (limit)
  "Find the next symbol up until LIMIT."
  (re-search-forward
   (rx symbol-start
       (1+ (or (syntax symbol) (syntax word)))
       symbol-end)
   limit t))

(defconst fontify-face-keywords
  `((fontify-face-find-next-symbol 0 (funcall 'fontify-face-colorize-matched-face)))
  "Keywords used for highlighting faces.

Note: instead of using constants we use functions which are not
expected to change very much.  This is to make toggling the
display somewhat reliable during updates.")

;;;###autoload
(define-minor-mode fontify-face-mode
  "Fontify symbols representing faces with that face."
  :lighter " 💡"
  (if fontify-face-mode
      (font-lock-add-keywords nil fontify-face-keywords)
    (font-lock-remove-keywords nil fontify-face-keywords)))

(provide 'fontify-face)
;;; fontify-face.el ends here
