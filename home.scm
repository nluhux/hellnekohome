(use-modules (gnu home)
             (gnu home services)
             (gnu home services shells)
             (gnu services)
             (gnu packages admin)
             (gnu packages base)
             (gnu packages certs)
	     (gnu packages compression)
             (gnu packages curl)
             (gnu packages emacs)
	     (gnu packages emacs-xyz)
	     (gnu packages w3m)
	     (gnu packages chromium)
	     (gnu packages package-management)
	     (gnu packages ssh)
	     (gnu packages rdesktop)
	     (gnu packages vnc)
	     (gnu packages wm)
	     (gnu packages terminals)
	     (gnu packages image)
	     (gnu packages xdisorg)
	     (gnu packages version-control)
	     (gnu packages xorg)
	     (gnu packages tmux)
	     (gnu packages screen)
	     (gnu packages pdf)
	     (gnu packages task-management)
	     (gnu packages virtualization)
	     (gnu packages dictionaries)
	     (gnu packages dico)
	     (gnu packages games)
	     (gnu packages gimp)
	     (gnu packages man)
	     (gnu packages texinfo)
	     (guix gexp)
)


(home-environment
 (packages (list
	    glibc-utf8-locales ;; locale
	    nss-certs curl ;; ca-certs
	    emacs-next-pgtk ;; code editor for lisp
	    emacs-rime ;; fast chinese input
	    emacs-paredit ;; for lisp
	    emacs-geiser emacs-geiser-guile ;; for guile
	    emacs-yasnippet ;; for guix devel
	    emacs-magit ;; for guix devel
	    emacs-company ;; for auto complete
	    emacs-telega ;; Telegram Client
	    emacs-org-download ;; note insert picture
	    openssh dropbear ;; for remote terminal
	    freerdp tigervnc-client ;; for remote desktop
	    emacs-w3m  w3m ungoogled-chromium/wayland ;; web browser
	    foot grim wl-clipboard ;; wayland don't put hikari on here
	    git ;; version control
	    uim ;; input method
	    tmux screen ;; terminal mu
	    zathura zathura-pdf-mupdf ;; book reader
	    tree ;; :-)
	    unzip ;; archive
	    blanket ;; niose player
	    qemu bochs ;; machine emu
	    sdcv emacs-sdcv emacs-dictionary dico translate-shell emacs-google-translate;; dictory
	    cataclysm-dda tintin++ curseofwar ;; game
	    gimp ;; picture editor
	    man-db texinfo ;; doc
	    asciinema ;; terminal recoder
	    ))
 (services
  (list 
   (service home-bash-service-type
            (home-bash-configuration
             (guix-defaults? #t)))
   (simple-service 'dotfile
		   home-files-service-type
		   (list `("config/hikari/hikari.conf" ;; Wayland WM
			   ,(local-file (string-append (getenv "HOME") "/home.d/hikari/hikari.conf")))
			 `("config/hikari/autostart"
			   ,(local-file (string-append (getenv "HOME") "/home.d/hikari/autostart")))
			 `("config/foot/foot.ini" ;; Wayland Terminal Emulator
			   ,(local-file (string-append (getenv "HOME") "/home.d/foot/foot.ini")))
			 `("tmux.conf"
			   ,(local-file (string-append (getenv "HOME") "/home.d/tmux/tmux.conf")))
			 `("screenrc"
			   ,(local-file (string-append (getenv "HOME") "/home.d/screen/screenrc")))
			 `("uim"  ;; terminal input method
			   ,(local-file (string-append (getenv "HOME") "/home.d/uim/uim")))
			 `("emacs.d/init.el" ;; code editor
			   ,(local-file (string-append (getenv "HOME") "/home.d/emacs/init.el")))
			 `("gitconfig" ;; version control
			   ,(local-file (string-append (getenv "HOME") "/home.d/git/gitconfig")))
			 `("dico" ;; dict client
			   ,(local-file (string-append (getenv "HOME") "/home.d/dico/dico"))
			   )
			 )))))
