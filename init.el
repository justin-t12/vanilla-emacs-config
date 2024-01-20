(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes '(modus-operandi))
 '(custom-safe-themes
   '("0340489fa0ccbfa05661bc5c8c19ee0ff95ab1d727e4cc28089b282d30df8fc8" "0af489efe6c0d33b6e9b02c6690eb66ab12998e2649ea85ab7cfedfb39dd4ac9" "f5661fd54b1e60a4ae373850447efc4158c23b1c7c9d65aa1295a606278da0f8" default))
 '(ispell-dictionary nil)
 '(package-selected-packages '(which-key modus-themes evil)))
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

(require 'modus-themes)
(load-theme 'modus-operandi)

(require 'evil)
(evil-mode 1)

(require 'which-key)
(which-key-mode 1)
(which-key-setup-side-window-bottom)
(which-key-setup-minibuffer)
