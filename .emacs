;;; Initial Emacs settings
;;; Modified by Xiaming Chen
;;; xiaming.chen@gmx.com

;; path where settings files are kept
(add-to-list 'load-path "~/.emacs.d/settings")

;; triggers to control plugins
(setq enable-auto-complete 1)
(setq enable-camelcase 1)
(setq enable-helm 1)
(setq enable-pig 1)
(setq enable-markdown 1)
(setq enable-python 1)
(setq enable-ido 1)
(setq enable-latex 1)
(setq enable-rstat 1)
(setq enable-yaml 1)
(setq enable-web-dev 1)
(setq enable-scss 1)
(setq enable-matlab 1)

;; define various custom functions
(require 'custom-functions)

;; install dependencies with el-get
(require 'el-get-settings)

;; install dependencies with MELPA
(require 'melpa-settings)

;; Configure general settings
(require 'general-settings)

;; EOF
