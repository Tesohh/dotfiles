;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Identification
(setq user-full-name "Simone Tesini"
      user-mail-address "simtesini@gmail.com")

;; Font settings
(setq doom-font (font-spec :family "SF Mono" :size 16)
      doom-variable-pitch-font (font-spec :family "SF Mono" :size 16))
(setq-default line-spacing 2)

;; Theme
(setq doom-theme 'doom-gruvbox)

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

;; Org
(setq org-directory "~/org")
(setq org-roam-directory "~/org/roam")
(setq org-agenda-files (list org-directory))
(after! org
  (setq org-startup-folded 'overview)
  (setq org-preview-latex-default-process 'dvisvgm)
  (setq org-log-into-drawer t)
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
