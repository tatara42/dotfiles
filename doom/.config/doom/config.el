;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;; =============================================================================
;;; Identification & Environment
;;; =============================================================================

(setq org-directory "~/org/")

;;; =============================================================================
;;; UI & Appearance
;;; =============================================================================

(setq doom-theme 'doom-gruvbox)

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 18 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 18))

(setq display-line-numbers-type 'relative)

;; Cursor configuration: static box cursor across all states
(setq-default cursor-type 'box)
(blink-cursor-mode -1)

(after! evil
  (setq evil-normal-state-cursor '(box)
        evil-insert-state-cursor '(box)
        evil-visual-state-cursor '(box)
        evil-replace-state-cursor '(box)
        evil-operator-state-cursor '(box)
        evil-motion-state-cursor '(box)
        evil-emacs-state-cursor '(box))
  (evil-define-key '(normal visual motion) 'global
    "gj" #'evil-next-visual-line
    "gk" #'evil-previous-visual-line))

;;; =============================================================================
;;; Dashboard / Splash Screen
;;; =============================================================================

(setq fancy-splash-image (expand-file-name "splash.png" doom-user-dir))

;; Ensure dashboard uses fancy image banner
(setq +dashboard-ascii-banner-fn #'+dashboard-draw-ascii-banner-fn)

;; Clean dashboard appearance: hide menus, load benchmark, and footer
;;(remove-hook '+dashboard-functions #'+dashboard-widget-shortmenu)
(remove-hook '+dashboard-functions #'+dashboard-widget-loaded)
(remove-hook '+dashboard-functions #'+dashboard-widget-footer)

;;; =============================================================================
;;; Performance Optimizations
;;; =============================================================================

;; Garbage collection tuning (defer GC during active use to eliminate stutter)
(use-package! gcmh
  :init
  (setq gcmh-idle-delay 'auto
        gcmh-auto-idle-delay-factor 10
        gcmh-high-cons-threshold (* 128 1024 1024))
  :config
  (gcmh-mode 1))

;; Faster IPC/process communication (LSP, Eglot, Vterm)
(setq read-process-output-max (* 3 1024 1024))

;; Display & scrolling optimizations
(setq fast-but-imprecise-scrolling t
      jit-lock-defer-time 0
      inhibit-compacting-font-caches t)

;; Disable bidirectional text rendering overhead
(setq-default bidi-paragraph-direction 'left-to-right)
(setq bidi-inhibit-bpa t)

;;; =============================================================================
;;; Packages & Modules
;;; =============================================================================

;; Eglot performance tuning (prevent memory bloat & UI freezes)
(after! eglot
  (setq eglot-events-buffer-size 0
        eglot-connect-timeout 10
        eglot-sync-connect nil))

;; Mason package manager integration
(use-package! mason
  :config (mason-setup))
