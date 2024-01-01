(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e9d47d6d41e42a8313c81995a60b2af6588e9f01a1cf19ca42669a7ffd5c2fde"
     default))
 '(package-selected-packages
   '(consult cyberpunk-theme evil linum-relative monokai-theme
	     terraform-mode vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(load-theme 'cyberpunk)
(evil-mode 1)
(vertico-mode 1)


; define my own function
(defun relative-nums ()
    (display-line-numbers-mode 1)
    (setq display-line-numbers 'relative)
   )

; hook into buffer update event
(add-hook 'buffer-list-update-hook 'relative-nums)
