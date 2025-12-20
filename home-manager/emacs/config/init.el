(require 'use-package)


(use-package use-package
	:custom
	(use-package-always-ensure nil)
	(usepackage-always-defer nil))
)


(use-package emacs

  :config
  (setq initial-major-mode 'org-mode)

  ;; No startup screen
  (setq inhibit-startup-message t)

  (setq custom-file "/dev/null")

  ;; Auto save errors are annoying
  (setq auto-save-default nil)
  
  ;; Disable the menu bar
  (menu-bar-mode -1)
  
  ;; Disable visible scrollbar
  (scroll-bar-mode -1)
  
  ;; Disable the toolbar
  (tool-bar-mode -1)
  
  ;; Disable tooltips
  (tooltip-mode -1)
  
  ;; Breathing room
  (set-fringe-mode 10)
  
  ;; No blinking
  (blink-cursor-mode 0)
  
  ;; Highlight current line
  (global-hl-line-mode)

)



(use-package evil
  :custom
  (evil-want-keybinding nil)
  (evil-respect-visual-line-mode t)
  (evil-undo-system 'undo-fu)
  :config
  (evil-set-leader nil (kbd "C-SPC"))
  (evil-set-leader 'normal (kbd "SPC"))
  (evil-set-leader 'motion (kbd "SPC"))
  (setq evil-respect-visual-line-mode t)
  (setq evil-undo-system 'undo-fu)
  (setq evil-redo-function 'undo-fu-only-redo)
  (define-key evil-motion-state-map (kbd "RET") nil)
  (evil-mode 1))


;; Enable corfu
(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-preview-current t)    ;; Disable current candidate preview
  (corfu-preselect 'prompt)      ;; Preselect the prompt
  (corfu-on-exact-match 'insert)     ;; Configure handling of exact matches
  (corfu-auto-delay 0.15)  ;; wait half a second though
  (corfu-auto-prefix 2) ;; also only for words 2 or more
  (corfu-min-width 120)
  (defun corfu-lsp-setup ()
    (setq-local completion-styles '(orderless flex hotfuzz)
                completion-category-defaults nil))
  (add-hook 'lsp-mode-hook #'corfu-lsp-setup)

  :init
  (global-corfu-mode 1))

(use-package nix-mode)

(use-package lsp-mode
  :config
  (setq lsp-completion-enable t)
  (setq lsp-keymap-prefix "SPC l")
  (evil-define-key 'normal lsp-mode-map (kbd "SPC l") lsp-command-map)
  (setq lsp-completion-provider :none)
  (setq major-mode-remap-alist
   '((gdscript-mode . gdscript-ts-mode)))
  :hook
  (lsp-mode . evil-normalize-keymaps)
  (nix-mode . lsp-deferred)
  (gdscript-mode . lsp-deferred)
  (gdscript-ts-mode . lsp-deferred))

(use-package lsp-nix
  :after (lsp-mode))

(use-package lsp-ui :commands lsp-ui-mode)


;; Enable vertico
(use-package vertico
  :custom
  (vertico-scroll-margin 0) ;; Different scroll margin
  (vertico-count 20) ;; Show more candidates
  (vertico-resize nil) ;; Grow and shrink the Vertico minibuffer
  (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :init
  (vertico-mode))

