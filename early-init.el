(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)


(let ((mono-spaced-font "Ubuntu Mono")
      (proportionately-spaced-font "Sans"))
  (set-face-attribute 'default nil :family mono-spaced-font :height 140)
  (set-face-attribute 'fixed-pitch nil :family mono-spaced-font :height 1.0)
  (set-face-attribute 'variable-pitch nil :family proportionately-spaced-font :height 1.0))

(set-frame-font "Ubuntu Mono 14" nil t)

