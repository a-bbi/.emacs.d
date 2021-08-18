(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))



;;Aqui van los "pluginss"
;;Ace-window
(use-package ace-window
	     :ensure t
	     :bind
	     ("C-x o" . ace-window)
	     :config
	     (setq aw-keys '(?a ?s ?d ?f)))


;; Multiple-cursos
(use-package multiple-cursors
	     :ensure t
	     :bind (
		    ("M-," . mc/mark-next-like-this)
		    ("M-i" . mc/mark-previous-like-this)
		    ("C-c z" . mc/mark-all-like-this)))


;;Undo-tree
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))


;;Auto-complete
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))


;;Web-mode
(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (setq web-mode-engines-alist
		'(("django"  . "\\.html\\'")))
  (setq web-mode-ac-sources-alist
		'(("css" . (ac-source-css-property))
          ("html" . (ac-source-work-in-buffer ac-source-abbrev))))
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-quoting t))
(setq web-mode-enable-current-column-highlight t)
(setq web-mode-enable-current-element-highlight t)


;;Emmet-mode
(use-package emmet-mode)
(add-hook 'web-mode-hook  'emmet-mode)
(add-hook 'web-mode-before-auto-complete-hooks
		  '(lambda ()
			 (let ((web-mode-cur-language
  					(web-mode-language-at-pos)))
               (if (string= web-mode-cur-language "php")
    			   (yas-activate-extra-mode 'php-mode)
      			 (yas-deactivate-extra-mode 'php-mode))
               (if (string= web-mode-cur-language "css")
    			   (setq emmet-use-css-transform t)
      			 (setq emmet-use-css-transform nil)))))


;;Treemacs
(use-package treemacs
  :ensure t
  :bind
  (:map global-map
		([f8] . treemacs)
        ("C-<f8>" . treemacs-select-window))
  :config
	(setq treemacs-is-never-other-window t))

;;Treemacs-icons
(require 'treemacs-all-the-icons)
(treemacs-load-theme "all-the-icons")

;;All-the-icons
;; (use-package all-the-icons)

;; (use-package all-the-icons-ivy
;; :init (all-the-icons-ivy-setup)
;; )

;; (use-package all-the-icons-dired
;;   :hook (dired-mode . all-the-icons-dired-mode))


;;Telegram(telega)
(use-package telega
  :load-path  "~/telega.el"
  :commands (telega)
  :defer t)

;; aqui van todos lo paquetes y personalizaciones que tenemos en nuestro emacs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(nord))
 '(custom-safe-themes
   '("37768a79b479684b0756dec7c0fc7652082910c37d8863c35b702db3f16000f8" default))
 '(fringe-mode '(1 . 1) nil (fringe))
 '(global-display-line-numbers-mode t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(telega treemacs-icons-dired treemacs-all-the-icons treemacs all-the-icons web-mode emmet-mode auto-complete undo-tree yasnippet multiple-cursors ace-window use-package))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(truncate-lines t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
