(require 'package) ;; melpa packges
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'load-path
	     "~/.emacs.d/nonelpa")
(package-initialize) ;; 
(global-linum-mode 1) ;;line numbers
(set-default 'truncate-lines t) ;;dont't wrap lines by default


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


;;required packages
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

(add-to-list 'load-path "~/go/src/github.com/dougm/goflymake/")
(require 'go-flymake)
(add-to-list 'load-path "/go/src/github.com/dougm/goflymake/")
(require 'go-flycheck)

;;read env variables from shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

;;hooks
(add-hook 'before-save-hook 'gofmt-before-save);;gofmt format go code uppon save
(add-hook 'go-mode-hook (lambda ();;go imports
                          (local-set-key (kbd "C-c i") 'go-goto-imports)))
(add-hook 'go-mode-hook (lambda ();;go remove unused imports
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

;;customize compile for golang
(setq compile-command "go build -v");; && go test -v && go vet") ;; if needed you can add more commands on the compile call
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
 '(custom-enabled-themes (quote (paganini)))
 '(custom-safe-themes
   (quote
    ("1e67765ecb4e53df20a96fb708a8601f6d7c8f02edb09d16c838e465ebe7f51b" default)))
 '(package-selected-packages
   (quote
    (js2-mode go-snippets yasnippet yaml-mode dockerfile-mode paganini-theme neotree exec-path-from-shell go-autocomplete 0blayout auto-complete go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
