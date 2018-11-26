;;melpa packages
(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))

(add-to-list 'load-path
	     "~/.emacs.d/nonelpa")
(package-initialize) ;; 

(global-linum-mode 1) ;;line numbers
(set-default 'truncate-lines t) ;;dont't wrap lines by default


;; Disable capitalization on auto-complete
(setq ac-ignore-case nil)


;; Enable mouse support 
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] (lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] (lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
)

;;enable clipboard in emacs, copy&paste in and out emacs.
(setq x-select-enable-clipboard t)
(defun copy-region-to-cut-buffer (beg end)
  (interactive "r")
  (call-process-region beg end "pbcopy"))

;;set mac command as super key
(setq mac-command-modifier 'super)

;;keyboard hooks
(global-set-key [f8] 'neotree-toggle)
(global-set-key [f12] 'copy-region-to-cut-buffer)
(global-set-key [(control x) (k)] 'kill-this-buffer)
(global-set-key (kbd "C-c C-c") 'recompile)


;;neotree open tree incurrent file directory
(setq neo-smart-open t)
;; backup in one place. flat, no tree structure
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))
;; disable auto-save and auto-backup
(setq auto-save-default nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'monokai)
