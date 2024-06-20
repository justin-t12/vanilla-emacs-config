(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)


;; from: https://emacs.stackexchange.com/questions/50600/use-package-wont-load
;; Bootstrap 'use-package'
(eval-after-load 'gnutls
  '(add-to-list 'gnutls-trustfiles "/etc/ssl/cert.pem"))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(require 'bind-key)
(setq use-package-always-ensure t)

(setq custom-file "./custom.el")

(setq make-backup-files nil)

(menu-bar-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq global-display-line-numbers 'relative)
(global-display-line-numbers-mode 1)

;;setting spell check program
(setq ispell-program-name "aspell")

;;setting sentance interaction behavior
(setq sentence-end-double-space nil)

;; theme
(use-package modus-themes
  :config
  (load-theme 'modus-vivendi t))

;; Display possible completions at all places
(use-package ido-completing-read+
  :ensure t
  :config
  ;; This enables ido in all contexts where it could be useful, not just
  ;; for selecting buffer and file names
  (ido-mode t)
  (ido-everywhere t)
  ;; This allows partial matches, e.g. "uzh" will match "Ustad Zakir Hussain"
  (setq ido-enable-flex-matching t)
  (setq ido-use-filename-at-point nil)
  ;; Includes buffer names of recently opened files, even if they're not open now.
  (setq ido-use-virtual-buffers t)
  :diminish nil)

;; Enhance M-x to allow easier execution of commands
(use-package smex
  :ensure t
  :disabled t
  :config
  (setq smex-save-file (concat user-emacs-directory ".smex-items"))
  (smex-initialize)
  :bind ("M-x" . smex))

;; undo tree (mainly for evil mode)
;; (use-package undo-tree
;;   :config
;;   (global-undo-tree-mode))

;; evil modes
(use-package evil
  :init
  (setq evil-want-keybinding nil) ;; don't load Evil keybindings in other modes
  (setq evil-want-fine-undo t)
  (setq evil-want-Y-yank-to-eol t)
  :config
  (evil-mode 1))

(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; which key
(use-package which-key
  :diminish which-key-mode
  :init
  (which-key-mode)
  (which-key-setup-minibuffer)
  :config
  (setq which-key-idle-delay 0.3))

(use-package company
  :bind (:map company-active-map
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
  :config
  (setq company-idle-delay 0.3)
  (global-company-mode t))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))
