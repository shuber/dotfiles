;;; evil-textobj-entire.el --- description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 Sean Huber
;;
;; Author: Sean Huber <http://github/shuber>
;; Maintainer: Sean Huber <sean@lendinghome.com>
;; Created: September 21, 2020
;; Modified: September 21, 2020
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  description
;;
;;; Code:


(defgroup evil-textobj-entire nil
  "Text object entire buffer for Evil"
  :prefix "evil-textobj-entire-"
  :group 'evil)

(defcustom evil-textobj-entire-key "e"
    "Key for evil-inner-entire"
    :type 'string
    :group 'evil-textobj-entire)

(evil-define-text-object evil-entire-entire-buffer (count &optional beg end type)
  "Select entire buffer"
  (evil-range (point-min) (point-max)))

(define-key evil-outer-text-objects-map evil-textobj-entire-key 'evil-entire-entire-buffer)
(define-key evil-inner-text-objects-map evil-textobj-entire-key 'evil-entire-entire-buffer)

(provide 'evil-textobj-entire)

;;; evil-textobj-entire.el ends here
