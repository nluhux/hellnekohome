;; GNU Guix 開發
;; 假设Guix项目在 ~/src/guix.
(with-eval-after-load 'geiser-guile
  (add-to-list 'geiser-guile-load-path "~/src/guix"))
(with-eval-after-load 'yasnippet
  (add-to-list 'yas-snippet-dirs "~/src/guix/etc/snippets"))
(setq user-full-name "Lu Hui")
(setq user-mail-address "luhux@foxmail.com")
(load-file "~/src/guix/etc/copyright.el")
(setq copyright-names-regexp
      (format "%s <%s>" user-full-name user-mail-address))
(add-hook 'after-save-hook 'copyright-update)
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(show-paren-mode 1)

;; 輸入法
(setq default-input-method 'rime)

;; 邮箱
(setq user-mail-address "luhux@foxmail.com"
      user-full-name "Lu Hui")
(setq gnus-select-method
      '(nnimap "foxmail"
	       (nnimap-address "imap.qq.com")
	       (nnimap-server-port "imaps")
	       (nnimap-stream ssl)))
(setq smtpmail-smtp-server "smtp.qq.com"
      smtpmail-smtp-service 587)

;; Telega
(setq telega-proxies
      (list
       '(:server "127.0.0.1" :port 7891 :enable t
		 :type (:@type "proxyTypeSocks5"))))


;; org-mode
(require 'org-download)
(add-hook 'dired-mode-hook 'org-download-enable)

;; auto complete
(global-company-mode)

;; ido mode
(ido-mode 1)

;; font
(add-to-list 'default-frame-alist
	     '(font . "Unifont-14"))

;; IRC
(setq erc-default-server "irc.libera.chat")
(setq erc-default-port 6667)
