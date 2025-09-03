;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Simone Tesini"
      user-mail-address "simtesini@gmail.com")



;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;


(setq doom-font (font-spec :family "SF Mono" :size 16)
      doom-variable-pitch-font (font-spec :family "SF Mono" :size 16))

(setq-default line-spacing 2)

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'everforest-hard-dark)
;; (setq doom-theme 'doom-gruvbox)
;; (setq doom-theme 'doom-one)
(setq doom-theme 'doom-rose-pine)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org")
(setq org-agenda-files (list org-directory))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
(after! org
  (setq org-startup-folded 'overview)
  (setq org-preview-latex-default-process 'dvisvgm)
  (setq org-log-into-drawer t)
  )

(after! corfu

  (add-hook 'prog-mode-hook (lambda () (setq-local corfu-preselect 'first)))
  (add-hook 'text-mode-hook (lambda () (setq-local corfu-preselect 'first)))
  (setq corfu-auto t

        corfu-auto-delay 0
        ;; corfu-preselect 'first
        corfu-preview-current nil
        +corfu-want-tab-prefer-expand-snippets t)
  )

;; (after! corfu
;;   (setq corfu-auto-prefix 2)
;;   (setq corfu-auto-delay 0))
;; (define-key corfu-map (kbd "RET") #'corfu-insert)
;; ;; Keep Corfu open on backspace
;; (setq corfu-quit-at-boundary nil
;;       corfu-quit-no-match nil
;;       )
;; (define-key corfu-map (kbd "DEL") #'delete-backward-char))

(setq olivetti-body-width 100)
(add-hook 'text-mode-hook (lambda ()
                            ;; (olivetti-set-width 120)
                            (olivetti-mode 1)))
(add-hook 'prog-mode-hook (lambda ()
                            ;; (olivetti-set-width 120)
                            (olivetti-mode 1)))

(map! :n "H" #'evil-first-non-blank
      :n "L" #'evil-end-of-line
      :v "H" #'evil-first-non-blank
      :v "L" #'evil-end-of-line
      :o "H" #'evil-first-non-blank
      :o "L" #'evil-end-of-line
      )
(setq scroll-margin 8)

(setq mac-command-modifier 'meta)
(add-to-list 'default-frame-alist '(undecorated . t))
(menu-bar-mode -1)
