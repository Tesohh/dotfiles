;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Identification
(setq user-full-name "Simone Tesini"
      user-mail-address "simtesini@gmail.com")

;; Font settings
(setq doom-font (font-spec :family "SF Mono" :size 16)
      doom-variable-pitch-font (font-spec :family "SF Mono" :size 16))
(setq-default line-spacing 2)

;; Theme
(setq doom-theme 'doom-rosepine)
;; (setq doom-theme 'doom-gruvbox)
;; (setq doom-theme 'catppuccin)

;; .vimrc
(map! :n "H" #'evil-first-non-blank
      :n "L" #'evil-last-non-blank
      :v "H" #'evil-first-non-blank
      :v "L" #'evil-last-non-blank
      :o "H" #'evil-first-non-blank
      :o "L" #'evil-last-non-blank
      )
(setq scroll-margin 8)
(setq display-line-numbers-type nil)

;;; add to $DOOMDIR/config.el
(after! treesit
  (setq treesit-font-lock-level 4))  ; default is 3

;; Org
(defun my/org-capture-to-roam-daily ()
  (interactive)
  (org-roam-dailies-capture-today))

(setq org-directory "~/org")
(setq org-agenda-files (list org-directory "~/org/roam"))
(after! org
  (setq org-capture-templates
        '(
          ("t" "TODO" entry
           (file "inbox.org")
           "* TODO %?\n %U")
          ("j" "journal entry in roam daily" plain
           (function my/org-capture-to-roam-daily)
           "%?")
          )
        )
  (setq org-startup-folded 'overview)
  (setq org-preview-latex-default-process 'dvisvgm)
  (setq org-log-into-drawer t)
  (map! :v "SPC e" #'org-emphasize)
  )

(add-hook 'doom-load-theme-hook
          (lambda ()
            (after! org
              (add-to-list 'org-emphasis-alist
                           `("*" (:inherit 'bold :foreground ,(doom-color 'red))))
              (add-to-list 'org-emphasis-alist
                           `("/" (:inherit 'italic :foreground ,(doom-color 'violet))))
              )))

;; (after! org-modern
;;   (setq org-modern-star 'replace)
;;   (setq org-modern-replace-stars "◉○◈◇")
;;   )

;; Org roam
(setq org-roam-directory "~/org/roam")
(after! org-roam
  (setq org-roam-dailies-capture-templates
        '(("d" "default" entry "* %?\n\n%T"
           :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n"))))
  )

;; Corfu
(after! corfu
  (add-hook 'prog-mode-hook (lambda () (setq-local corfu-preselect 'first)))
  (add-hook 'text-mode-hook (lambda () (setq-local corfu-preselect 'first)))
  (setq corfu-auto t
        corfu-auto-delay 0
        corfu-preview-current nil
        +corfu-want-tab-prefer-expand-snippets t)
  )

;; Olivetti
(setq olivetti-body-width 100)
(add-hook 'text-mode-hook (lambda ()
                            ;; (olivetti-set-width 120)
                            (olivetti-mode 1)))
(add-hook 'prog-mode-hook (lambda ()
                            ;; (olivetti-set-width 120)
                            (olivetti-mode 1)))

;; Mac specific
(setq mac-command-modifier 'meta)
(menu-bar-mode -1)

;; Disable decorations
(add-to-list 'default-frame-alist '(undecorated . t))

(defun show-face-at-point ()
  "Show the face at point."
  (interactive)
  (message "Face: %s" (get-char-property (point) 'face)))
