;; Add package servers
(add-to-list 'package-archives '("gnu"  . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initalize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package emacs

  :config
  (setq initial-major-mode 'org-mode)

  ;; No startup screen
  (setq inhibit-startup-message t)

  (setq custom-file "/dev/null")

  (setq ring-bell-function 'ignore)

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
  


  (setq default-tab-width 4)
  (setq-default c-basic-offset 4)

  (add-to-list 'default-frame-alist '(width  . 140))
  (add-to-list 'default-frame-alist '(height . 80))
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

(use-package nix-mode
  :mode "\\.nix\\'"
)


(use-package nixpkgs-fmt
  :hook
  (nix-mode . nixpkgs-fmt-on-save-mode))


  (use-package direnv
  :init
  (direnv-mode)
  :config
  (custom-set-variables
   '(direnv-non-file-modes '(compilation-mode
                             dired-mode
                             eshell-mode
                             magit-status-mode)))

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
)

(use-package lsp-ui
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-flycheck-enable t)
  (lsp-ui-peek-enable t)
  :commands lsp-ui-mode
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

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

  (set-face-attribute 'default nil
                    :family "JetBrains Mono Nerd Font"
		    ;; :family "Pragmata Pro Mono"
		    :height 120
                    :weight 'medium)

(setq-default line-spacing 0)

