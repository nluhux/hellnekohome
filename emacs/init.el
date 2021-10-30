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

;; 高亮当前行
(global-hl-line-mode 1)


;; 图形设置
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)


;; 主题设置
(load-theme 'modus-vivendi)


;; 字典
(require 'dictionary)
(autoload 'dictionary-search "dictionary"
  "Ask for a word and search it in all dictionaries" t)
(autoload 'dictionary-match-words "dictionary"
  "Ask for a word and search all matching words in the dictionaries" t)
(autoload 'dictionary-lookup-definition "dictionary"
  "Unconditionally lookup the word at point." t)
(autoload 'dictionary "dictionary"
  "Create a new dictionary buffer" t)
(autoload 'dictionary-mouse-popup-matching-words "dictionary"
  "Display entries matching the word at the cursor" t)
(autoload 'dictionary-popup-matching-words "dictionary"
  "Display entries matching the word at the point" t)
(autoload 'dictionary-tooltip-mode "dictionary"
  "Display tooltips for the current word" t)
(autoload 'global-dictionary-tooltip-mode "dictionary"
  "Enable/disable dictionary-tooltip-mode for all buffers" t)
(setq dictionary-server "dict.tw")
(global-set-key "\C-cs" 'dictionary-search)
(global-set-key "\C-cy" 'sdcv-search-pointer)
(eval-after-load 'google-translate-core
  '(setq google-translate-base-url "http://translate.google.cn/translate_a/single"
         google-translate-listen-url "http://translate.google.cn/translate_tts"))

(eval-after-load 'google-translate-tk
  '(setq google-translate--tkk-url "http://translate.google.cn/"))


;; golang
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))


