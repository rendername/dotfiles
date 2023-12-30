(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://melpa.org/packages/") t)
(package-initialize)

(menu-bar-mode -1)
(tool-bar-mode -1)
(global-display-line-numbers-mode)
(setq font-lock-maximum-decoration t)
(setq inhibit-startup-screen t)
(setq display-line-numbers 'relative)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hcl-indent-level 4)
 '(package-selected-packages
   '(cyberpunk-2019-theme cyberpunk-theme hcl-mode monokai-theme
			  terraform-mode))
 '(safe-local-variable-values '((git-commit-major-mode . git-commit-elisp-text-mode)))
 '(terraform-indent-level 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'cyberpunk t)
(setq make-backup-files nil)
