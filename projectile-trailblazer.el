;;; projectile-trailblazer.el --- Minor mode for Rails projects using trailblazer based on projectile-rails

;; Copyright (C) 2017 Michael Dahl

;; Author:            Michael Dahl <michael.dahl84@gmail.com>
;; URL:               https://github.com/micdahl/projectile-trailblazer
;; Version:           0.1.0
;; Keywords:          rails, projectile, trailblazer
;; Package-Requires:  ((emacs "24.4") (projectile "0.12.0") (inflections "1.1") (inf-ruby "2.2.6") (f "0.13.0") (rake "0.3.2"))

;; This file is NOT part of GNU Emacs.

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:
;;
;; To start it for the rails projects:
;;
;;    (projectile-trailblazer-global-mode)
;;
;;; Code:

(require 'cl)
(require 'projectile)
(require 'projectile-rails)
(require 'inf-ruby)
(require 'inflections)
(require 'f)
(require 'rake)
(require 'json)

(defgroup projectile-trailblazer nil
  "Rails mode for trailblazer based on projectile"
  :prefix "projectile-trailblazer-"
  :group 'projectile)

(defun projectile-trailblazer-find-cell ()
  "Find a cell."
  (interactive)
  (projectile-rails-find-resource
   "cell: "
   '(("app/concepts/" "/concepts/\\(.+/cell/.+\\)\\.rb$"))))

(defun projectile-trailblazer-find-contract ()
  "Find a contract."
  (interactive)
  (projectile-rails-find-resource
   "contract: "
   '(("app/concepts/" "/concepts/\\(.+/contract/.+\\)\\.rb$"))))

;;;###autoload
(define-minor-mode projectile-trailblazer-mode
  "Rails trailblazer mode based on projectile-rails"
  :init-value nil
  :lighter " Trailblazer"
  (when projectile-trailblazer-mode
    (and projectile-rails-expand-snippet (projectile-rails-expand-snippet-maybe))
    (and projectile-rails-add-keywords (projectile-rails-add-keywords-for-file-type))
    (projectile-rails-set-assets-dirs)
    (projectile-rails-set-fixture-dirs)))

;;;###autoload
(defun projectile-trailblazer-on ()
  "Enable `projectile-trailblazer-mode' minor mode if this is a rails project."
  (when (and
         (projectile-project-p)
         (not (projectile-rails--ignore-buffer-p))
         (projectile-rails-root))
    (projectile-trailblazer-mode +1)))

;;;###autoload
(define-globalized-minor-mode projectile-trailblazer-global-mode
  projectile-trailblazer-mode
  projectile-trailblazer-on)

(defun projectile-trailblazer-off ()
  "Disable `projectile-rails-mode' minor mode."
  (projectile-trailblazer-mode -1))

(provide 'projectile-trailblazer)
;;; projectile-trailblazer.el ends here
