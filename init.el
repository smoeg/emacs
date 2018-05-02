;;; package -- Emacs init
;;; commentary:

;;; code:
(require 'package)

(setq package-list '(clang-format
                     company-glsl
                     cuda-mode
                     cyberpunk-theme
                     faff-theme
                     flycheck-haskell
                     ir-black-theme
                     ivy
                     shader-mode
                     undo-tree))

(add-to-list 'package-archives
     '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;;(standard-display-ascii ?\t "^I")

;; Frame titles.
(setq frame-title-format
      (concat "%b - emacs@" (system-name)))

;; spellcheck in text and latex mode.
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(latex-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

;; Define special keys.
(global-set-key (kbd "<f6>") 'compile)
(global-set-key (kbd "<f7>") 'delete-trailing-whitespace)
(global-set-key (kbd "<f8>") 'clang-format-region)

(global-auto-revert-mode 1)
(setq inhibit-splash-screen t)
(setq diff-switches "-u")
(setq inhibit-default-init t)
(setq indent-tabs-mode nil)
(setq column-number-mode t)
(setq make-backup-files nil)
(setq-default word-wrap t)
(global-visual-line-mode t)
(setq-default show-trailing-whitespace t)

;; Turn on font-lock mode.
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

(setq c-default-style '((other . "stroustrup")))

;; Mode hook stuff.

(setq c-mode-hook
      (function (lambda ()
      (setq indent-tabs-mode nil)
      (setq c-indent-level 4))))

(setq c++-mode-hook
      (function (lambda ()
      (setq indent-tabs-mode nil)
      (setq c-indent-level 4))))

(setq python-mode-hook
      (function (lambda ()
      (setq indent-tabs-mode nil))))

;; Packages.
(require 'undo-tree)
(global-undo-tree-mode)
(require 'ivy)
(require 'shader-mode)
(require 'clang-format)
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'after-init-hook 'global-company-mode)

;; (require 'faff-theme)
(require 'cyberpunk-theme)
;; (require 'ir-black-theme)

(provide 'init)
;;; init.el ends here
