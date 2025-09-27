;;; doom-rosepine-theme.el --- Doom Emacs theme port of Rose Pine -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: Gabriel Hooks (Echinoidea)
;; Maintainer: Gabriel Hooks (Echinoidea)
;; Source: https://github.com/rose-pine/rose-pine
;;
;;; Commentary:
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup doom-rosepine-theme nil
  "Options for the `doom-rosepine' theme."
  :group 'doom-themes)

(defcustom doom-rosepine-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-rosepine-theme
  :type 'boolean)

(defcustom doom-rosepine-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-rosepine-theme
  :type 'boolean)

(defcustom doom-rosepine-comment-bg doom-rosepine-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-rosepine-theme
  :type 'boolean)

(defcustom doom-rosepine-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-rosepine-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme doom-rosepine
    "A dark theme inspired by Rose Pine"
  :family 'doom-rosepine
  :background-mode 'dark

  ;; name        default   256       16
  (
   ;; Rose Pine main palette
   (rp-base       '("#191724" "black"   "black"  ))
   (rp-surface    '("#1f1d2e" "black"   "black"  ))
   (rp-overlay    '("#26233a" "grey"    "grey"   ))
   (rp-muted      '("#6e6a86" "grey"    "grey"   ))
   (rp-subtle     '("#908caa" "grey"    "grey"   ))
   (rp-text       '("#e0def4" "white"   "white"  ))
   (rp-love       '("#eb6f92" "red"     "red"    ))
   (rp-gold       '("#f6c177" "yellow"  "yellow" ))
   (rp-rose       '("#ebbcba" "cyan"    "cyan"   ))
   (rp-pine       '("#31748f" "blue"    "blue"   ))
   (rp-foam       '("#9ccfd8" "cyan"    "cyan"   ))
   (rp-iris       '("#c4a7e7" "magenta" "magenta"))
   (rp-leaf       '("#95b1ac" "green"   "green"  ))
   ;; Rose Pine highlight colors
   (rp-highlight-low  '("#21202e" "grey" "grey"))
   (rp-highlight-med  '("#403d52" "grey" "grey"))
   (rp-highlight-high '("#524f67" "grey" "grey"))

   ;; ui
   (alt-accent            (doom-lighten rp-rose 0.4))
   (ui-line               rp-surface)
   (ui-panel-shadow       (doom-darken rp-base 0.35))
   (ui-panel-border       rp-overlay)
   (ui-gutter-normal      rp-muted)
   (ui-gutter-active      rp-subtle)
   (ui-selection-bg       rp-highlight-med)
   (ui-selection-inactive rp-highlight-low)
   (ui-selection-border   rp-highlight-high)
   (ui-guide-normal       (doom-darken rp-muted 0.35))
   (ui-guide-active       rp-subtle)
   (ui-org-block          (doom-darken rp-base 0.10))
   (elscreen-bg           (doom-darken rp-overlay 0.25))
   (elscreen-fg           rp-surface)
   ;; vcs
   (vcs-added    rp-leaf)
   (vcs-modified rp-foam)
   (vcs-removed  rp-love)

   (bg         rp-base)
   (bg-alt     rp-surface)
   (base0      ui-gutter-normal)
   (base1      ui-gutter-active)
   (base2      ui-selection-bg)
   (base3      ui-org-block)
   (base4      ui-selection-border)
   (base5      ui-guide-normal)
   (base6      ui-guide-normal)
   (base7      ui-panel-shadow)
   (base8      ui-panel-border)
   (fg         rp-text)
   (fg-alt     rp-subtle)

   (grey       rp-muted)
   (red        rp-love)
   (orange     rp-gold)
   (green      rp-leaf)
   (teal       rp-pine)
   (yellow     rp-gold)
   (blue       rp-foam)
   (dark-blue  (doom-darken rp-pine 0.2))
   (magenta    rp-iris)
   (violet     (doom-lighten rp-iris 0.2))
   (cyan       rp-rose)
   (dark-cyan  rp-pine)

   ;; face categories -- required for all themes
   (highlight      rp-gold)
   (vertical-bar   ui-panel-border)
   (selection      nil)
   (builtin        rp-foam)
   (comments       (if doom-rosepine-brighter-comments rp-pine rp-muted))
   (doc-comments   (doom-lighten (if doom-rosepine-brighter-comments rp-pine rp-muted) 0.25))
   (constants      rp-iris)
   (functions      rp-rose)
   (keywords       rp-pine)
   (methods        rp-foam)
   (operators      rp-subtle)
   (type           rp-gold)
   (strings        rp-gold)
   (variables      rp-text)
   (numbers        rp-iris)
   (region         ui-selection-bg)
   (error          rp-love)
   (warning        rp-gold)
   (success        rp-leaf)
   (vc-modified    vcs-modified)
   (vc-added       vcs-added)
   (vc-deleted     vcs-removed)

   ;; custom categories
   (hidden     (car bg))
   (-modeline-bright doom-rosepine-brighter-modeline)
   (-modeline-pad
    (when doom-rosepine-padded-modeline
      (if (integerp doom-rosepine-padded-modeline) doom-rosepine-padded-modeline 4)))

   (modeline-fg     rp-text)
   (modeline-fg-alt rp-gold)

   (modeline-bg
    (if -modeline-bright
        (doom-darken rp-pine 0.45)
      `(,(doom-darken (car bg-alt) 0.1) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        (doom-darken rp-pine 0.475)
      `(,(doom-darken (car bg-alt) 0.15) ,@(cdr base0))))
   (modeline-bg-inactive   `(,(car bg-alt) ,@(cdr base1)))
   (modeline-bg-inactive-l `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg-alt))))

  ;;;; Base theme face overrides
  ((hl-line :background rp-highlight-low)
   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)
   (diff-removed :foreground vcs-removed)
   (font-lock-comment-face
    :foreground comments
    :background (if doom-rosepine-comment-bg (doom-lighten bg 0.05) 'unspecified))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)
   (font-lock-string-face :foreground strings)
   (font-lock-type-face :foreground type :weight 'bold)
   (font-lock-constant-face :foreground constants)
   (font-lock-number-face :foreground numbers)
   (font-lock-boolean-face :foreground red :weight 'bold)
   (font-lock-keyword-face :foreground keywords :weight 'bold)
   (font-lock-function-name-face :foreground functions)
   (font-lock-variable-name-face :foreground variables)
   (font-lock-builtin-face :foreground builtin)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if -modeline-bright base8 highlight))

   ;;;; LSP
   (lsp-face-highlight-textual :background alt-accent :foreground rp-base)


   ;;;; nav-flash
   (nav-flash-face :background rp-rose :foreground rp-base )

   ;;;; company
   (company-tooltip :foreground rp-text :background rp-base)
   (company-tooltip-annotation :foreground rp-text)
   (company-tooltip-selection :background rp-surface)
   (company-tooltip-search :foreground rp-gold :weight 'bold)
   (company-scrollbar-bg :background rp-base)
   (company-scrollbar-fg :background rp-muted)
   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground teal)
   ;;;; doom-modeline
   (doom-modeline-bar :background (if -modeline-bright modeline-bg modeline-bg) :weight 'normal)
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'normal)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'normal)
   (doom-modeline-buffer-project-root :foreground green :weight 'normal)
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background elscreen-bg :foreground elscreen-fg)
   ;;;; ivy
   (ivy-current-match :background rp-subtle)
   (ivy-minibuffer-match-face-1 :foreground rp-gold :weight 'bold)
   (ivy-minibuffer-match-face-2 :foreground rp-gold :weight 'bold)
   (ivy-minibuffer-match-face-3 :foreground rp-gold :weight 'bold)
   (ivy-minibuffer-match-face-4 :foreground rp-gold :weight 'bold)
   ;;;; LaTeX-mode
   (font-latex-math-face :foreground green)
   ;;;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground cyan)
   ((markdown-code-face &override) :background (doom-lighten rp-base 0.05))
   ;;;; org-mode
   (org-hide :foreground hidden)
   (org-headline-done :foreground rp-muted)
   (org-document-info-keyword :foreground comments)
   (org-macro :foreground rp-subtle)
   (org-level-1 :foreground cyan :weight 'bold)
   (org-level-2 :foreground magenta :weight 'bold)
   (org-level-3 :foreground blue :weight 'bold)
   (org-level-4 :foreground green :weight 'bold)
   (org-code :foreground rp-gold :background rp-overlay)
   (org-verbatim :foreground rp-rose)
   (org-scheduled-today :foreground blue)
   ;;;; mic-paren
   ((paren-face-match &override) :foreground fg :background ui-selection-bg :weight 'ultra-bold)
   ;;;; rjsx-mode / js2-mode / typescript-mode / typescript-tsx-mode
   (rjsx-tag :foreground teal)
   (rjsx-tag-bracket-face :foreground (doom-darken teal 0.5))
   (rjsx-attr :foreground cyan)
   (js2-object-property :foreground blue)
   (js2-function-call :foreground functions)
   (js2-function-param :foreground variables)
   (typescript-keyword :foreground keywords)
   (typescript-type :foreground type)
   (typescript-access-modifier :foreground keywords)
   (typescript-primitive-face :foreground type)
   (typescript-class-name :foreground type)
   (typescript-function-name :foreground functions)
   (typescript-method-name :foreground methods)
   ;; TypeScript TSX mode
   (typescript-tsx-tag-face :foreground teal)
   (typescript-tsx-tag-bracket-face :foreground (doom-darken teal 0.5))
   (typescript-tsx-attribute-face :foreground cyan)
   (typescript-tsx-expression-braces-face :foreground rp-subtle)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))
   ;;;; web-mode
   (web-mode-html-tag-face :foreground teal)
   (web-mode-variable-name-face :foreground rp-love)
   (web-mode-function-name-face :foreground rp-iris)
   (web-mode-html-tag-bracket-face :foreground (doom-darken teal 0.5))
   (web-mode-html-attr-name-face :foreground cyan)
   ;;;; tree-sitter faces
   (tree-sitter-hl-face:string :foreground strings)
   (tree-sitter-hl-face:type :foreground type :weight 'bold)
   (tree-sitter-hl-face:constant :foreground constants)
   (tree-sitter-hl-face:number :foreground numbers)
   (tree-sitter-hl-face:operator :foreground operators)
   (tree-sitter-hl-face:keyword :foreground keywords :weight 'bold)
   (tree-sitter-hl-face:function :foreground functions)
   (tree-sitter-hl-face:function.call :foreground functions)
   (tree-sitter-hl-face:variable :foreground variables)
   (tree-sitter-hl-face:property :foreground blue)
   (tree-sitter-hl-face:method :foreground functions)
   (tree-sitter-hl-face:tag :foreground teal)
   (tree-sitter-hl-face:attribute :foreground cyan)
   (tree-sitter-hl-face:constructor :foreground type)
   (tree-sitter-hl-face:punctuation :foreground rp-subtle)
   (tree-sitter-hl-face:punctuation.bracket :foreground rp-muted)
   (tree-sitter-hl-face:punctuation.delimiter :foreground rp-subtle)))

;;; doom-rosepine-theme.el ends here
