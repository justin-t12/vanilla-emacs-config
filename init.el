(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-safe-themes
   '("0af489efe6c0d33b6e9b02c6690eb66ab12998e2649ea85ab7cfedfb39dd4ac9" default))
 '(package-selected-packages
   '(evil-collection undo-tree evil-org which-key modus-themes evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(menu-bar-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq display-line-numbers 'relative)

;;setting spell check program
(setq ispell-program-name "aspell")

;;setting sentance interaction behavior
(setq sentence-end-double-space nil)

;; theme
(use-package modus-themes
  :config
  (load-theme 'modus-vivendi))

;; undo tree (mainly for evil mode)
(use-package undo-tree
  :config
  (global-undo-tree-mode))

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
