;;; mappings.el -*- lexical-binding: t; -*-
;;;

;; example
;;
;; (map! :leader
;;    (:prefix-map ("a" . "applications")
;;     (:prefix ("j" . "journal")
;;      :desc "New journal entry" "j" #'org-journal-new-entry
;;      :desc "Search journal entry" "s" #'org-journal-search)))

;; Don't require shift to enter command mode
(define-key evil-normal-state-map (kbd ";") 'evil-ex)

;; Keybindings for window/split movements
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-next)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-prev)

;; Expand region
(define-key evil-normal-state-map (kbd "C-e") 'er/expand-region)

(add-hook 'eshell-mode-hook
          (lambda ()
            (define-key eshell-mode-map (kbd "C-j") 'evil-window-next)
            (define-key eshell-mode-map (kbd "C-k") 'evil-window-prev)
          ))

;; Navigate directory of current file
(define-key evil-normal-state-map (kbd "-") 'dired-jump)

;; Navigate to previous workspace
(define-key evil-normal-state-map (kbd "C-h")
  (lambda ()
    (interactive)
    (persp-prev)
    (+workspace/display)
    ))

;; Navigate to next workspace
(define-key evil-normal-state-map (kbd "C-l")
  (lambda ()
    (interactive)
    (persp-next)
    (+workspace/display)
    ))

;; Open new workspace
(define-key evil-normal-state-map (kbd "\\t") 'make-frame)

;; Open new window buffer below
(define-key evil-normal-state-map (kbd "\\s")
  (lambda ()
    (interactive)
    (split-window-below)
    (other-window 1)
    (let ((buffer (generate-new-buffer "untitled")))
      (set-buffer-major-mode buffer)
      (switch-to-buffer buffer)
      )))

;; Open new window buffer right
(define-key evil-normal-state-map (kbd "\\v")
  (lambda ()
    (interactive)
    (split-window-right)
    (other-window 1)
    (let ((buffer (generate-new-buffer "untitled")))
      (set-buffer-major-mode buffer)
      (switch-to-buffer buffer)
      )))

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

(add-hook 'evil-normal-state-entry-hook
  (lambda ()
    (map!
     :leader (:prefix ("d" . "database")
              :desc "Send/eval SQL Buffer" "s" #'sql-send-buffer))))

(add-hook 'evil-normal-state-entry-hook
  (lambda ()
    (map!
     :leader (:prefix ("t" . "toggle")
              :desc "Tetris" "t" #'tetris))))

(add-hook 'evil-visual-state-entry-hook
  (lambda ()
        (map! :leader
        (:prefix ("d" . "database")
                :desc "Send/eval SQL Region" "s" #'sql-send-region))))
