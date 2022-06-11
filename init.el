;
; Initial Appearance
;
; Hide UI
(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))
; Hide Startup Message
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
; Make Title Bar Transparent
(when (eq system-type 'darwin)
  ;(setq frame-title-format nil)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)))
; Use SF Mono
(when (eq system-type 'darwin)
  (set-face-attribute 'default nil :font "SF Mono-12"))


;
; Set Up Packages
;
; Add Melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
; Install Use-Package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
; Configure Use-Package
(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)
(require 'bind-key)


;
; Load Literate Emacs Config
;
(org-babel-load-file "~/.emacs.d/config.org")
