(require 'package)

(add-to-list 'package-archives
	'("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; list the packages you want
(setq package-list
      '(ac-c-headers
	color-theme-solarized
	evil
	flycheck
	go-autocomplete go-mode go-snippets golint gotest))

;; activate all the packages
(package-initialize)

;; fetch the list of packages available 
(unless package-archive-contents
	(package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
	(unless (package-installed-p package)
	  (package-install package)))

;; env
(setenv "GOPATH" "/home/nhlfr/gopath")
(setenv "PATH" (concat (getenv "PATH") ":/home/nhlfr/gopath/bin"))
(setq exec-path (append exec-path '("/home/nhlfr/gopath/bin")))

;; autocompletion
(require 'go-autocomplete)
(require 'auto-complete-config)
(with-eval-after-load 'go-mode
  (require 'go-autocomplete))
(ac-config-default)

;; c indentation
(setq-default c-basic-offset 8
                  tab-width 8
                  indent-tabs-mode t)

;; go-mode hooks
(add-hook 'go-mode-hook
	  (lambda ()
	    (add-hook 'before-save-hook 'gofmt-before-save)))

;; evil
(require 'evil)
(evil-mode 1)

;; font
(set-default-font "Monospace 8")

;; linum mode
(add-hook 'prog-mode-hook 'linum-mode)

;; bars
(menu-bar-mode -1)
(tool-bar-mode -1)

;; solarized
(set-frame-parameter nil 'background-mode 'dark)
(load-theme 'solarized t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.50")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-source-path (quote (("/home/nhlfr" "/home/nhlfr"))))
 '(package-selected-packages
   (quote
    (color-theme-solarized python-environment golint go-snippets go-mode go-autocomplete epc))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
