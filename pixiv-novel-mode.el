;;; pixiv-novel-mode.el --- Major mode for pixiv novel

;; Copyright (C) 2014 pixiv

;; Author: USAMI Kenta <tadsan@zonu.me>
;; Keywords: novel pixiv
;; Version: 0.0.1

;; This file is NOT part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This is a major-mode for editing novel pixiv Novel format.

;;; Code:

(defconst pixiv-novel-syntax-keywords
  (list
   (cons
    (concat
     "\\(\\[\\)"
     "\\(newpage\\)"
     "\\(\\]\\)")
    '((1 font-lock-keyword-face)
      (2 font-lock-builtin-face)
      (3 font-lock-keyword-face)))
   (cons
    (concat
     "\\(\\[\\)"
     "\\(chapter:\\)"
     "\\([^\]]+\\)"
     "\\(\\]\\)")
    '((1 font-lock-keyword-face)
      (2 font-lock-builtin-face)
      (3 font-lock-function-name-face)
      (4 font-lock-keyword-face)))
   (cons
    (concat
     "\\(\\[\\[\\)"
     "\\(\\jumpuri:\\)"
     "\\([^>]+\\)"
     "\\( > \\)"
     "\\(https?://[^\]]+\\)"
     "\\(\\]\\]\\)")
    '((1 font-lock-keyword-face)
      (2 font-lock-builtin-face)
      (3 font-lock-function-name-face)
      (4 font-lock-keyword-face)
      (5 font-lock-string-face)
      (6 font-lock-keyword-face)))
   (cons
    (concat
     "\\(\\[\\)"
     "\\(jump:\\)"
     "\\([1-9][0-9]*\\)"
     "\\(\\]\\)")
    '((1 font-lock-keyword-face)
      (2 font-lock-builtin-face)
      (3 font-lock-function-name-face)
      (4 font-lock-keyword-face)))
   (cons
    (concat
     "\\(\\[\\)"
     "\\(pixivimage:\\)"
     "\\([1-9][0-9]*\\)"
     "\\(\\]\\)")
    '((1 font-lock-keyword-face)
      (2 font-lock-builtin-face)
      (3 font-lock-function-name-face)
      (4 font-lock-keyword-face)))))

(defvar pixiv-novel-mode-hook nil)

(define-derived-mode pixiv-novel-mode fundamental-mode "pixivNovel"
  "Major mode for pixiv novel"
  (set (make-local-variable 'font-lock-defaults) '(pixiv-novel-syntax-keywords)))

(provide 'pixiv-novel-mode)
;;; pixiv-novel-mode.el ends here
