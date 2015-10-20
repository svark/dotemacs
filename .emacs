; directory to load from.
(add-to-list 'load-path "~/.emacs.d/lisp")
;(add-to-list 'load-path "~/.emacs.d/cc")
;(add-to-list 'load-path "E:/apps/Emacs/Emacs32/lisp")
;(add-to-list 'load-path "~/.emacs.d/cedet-1.0.1/common")
;(load "~/.emacs.d/cedet-1.0.1/common/cedet.el")

;(add-to-list 'load-patseh "e:/apps/emacs/site-lisp/w3m")
;;; *font consolas
(set-default-font "-*-Source code pro-normal-r-*-*-15-97-*-*-c-*-iso8859-1")
(setq font-lock-maximum-decoration t)
;; turn on fancy prompts in the shell
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; win32 caret
(setq-default w32-use-visible-system-caret nil)
(blink-cursor-mode t)
(tooltip-mode nil)
;;; *color theme
(setq default-frame-alist '((right-fringe)
                            (left-fringe)
                            (scroll-bar-foreground . "gray39")
                            (scroll-bar-background . "gray19")
;                           (font . "Sans 8")
                            (vertical-scroll-bars)
                            (tool-bar-lines . 0)))
;(require 'color-theme)

;;; color theme customizatio
(defun color-theme-inkpot ()
  "Color theme based on the Inkpot theme. Ported and tweaked by Per Vognsen."
  (interactive)
  (color-theme-install
   '(color-theme-inkpot
     ((foreground-color . "#cfbfad")
      (background-color . "#1e1e27")
      (border-color . "#3e3e5e")
      (cursor-color . "#404040")
      (background-mode . dark))
     (comint-highlight-input ((t (:bold t :weight bold))))
     (comint-highlight-prompt ((t (:foreground "dark blue"))))
     (region ((t (:background "#404040"))))
     (highlight ((t (:background "#404040"))))
     (fringe ((t (:background "#16161b"))))
     (show-paren-match-face ((t (:background "#606060"))))
     (isearch ((t (:bold t :foreground "#303030" :background "#cd8b60"))))
     (modeline ((t (:bold t :foreground "#b9b9b9" :background "#3e3e5e"))))
     (modeline-inactive ((t (:foreground "#708090" :background "#3e3e5e"))))
     (modeline-buffer-id ((t (:bold t :foreground "#b9b9b9" :background "#3e3e5e"))))
     (minibuffer-prompt ((t (:bold t :foreground "#708090"))))
     (font-lock-builtin-face ((t (:foreground "#c080d0"))))
     (font-lock-comment-face ((t (:foreground "#708090")))) ; original inkpot: #cd8b00
     (font-lock-constant-face ((t (:foreground "#506dbd"))))
     (font-lock-doc-face ((t (:foreground "#cd8b00"))))
     (font-lock-function-name-face ((t (:foreground "#87cefa"))))
     (font-lock-keyword-face ((t (:bold t :foreground "#c080d0"))))
     (font-lock-preprocessor-face ((t (:foreground "309090"))))
     (font-lock-reference-face ((t (:bold t :foreground "#808bed"))))
     (font-lock-string-face ((t (:foreground "#ffcd8b" :background "#404040"))))
     (font-lock-type-face ((t (:foreground "#ff8bff"))))
     (font-lock-constant-face ((t (:foreground "#ff00ff"))))
     (font-lock-variable-name-face ((t nil)))
     (font-lock-warning-face ((t (:foreground "#ffffff" :background "#ff0000")))))))
;(color-theme-inkpot)
;; (require 'color-theme-solarized)
;; (color-theme-solarized "light")
(setq solarized-high-contrast-mode-line nil)
(setq solarized-distinct-fringe-background t)
;(require 'zenburn)
;(zenburn)
;(color-theme-inkpot)
;(color-theme-midnight)
;;; show matching parenthesis
(show-paren-mode t)

;;****************************************************************
;;; autopair
(require 'autopair)
;; (autopair-global-mode 1)

;
;;****************************************************************
;; delete the selection area with a keypress
(delete-selection-mode t)

;; make the current 'selection' visible
(transient-mark-mode t)

;; ****************************************************************
;;ido mode
;; (require 'ido)
;; (ido-mode 'both) ;; for buffers and files
;; (setq
;;  ido-save-directory-list-file "~/.emacs.d/cache/ido.last"

;;  ido-ignore-buffers ;; ignore thennnse guys
;;  '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace"

;;    "^\*compilation" "^\*ggtags" "^session\.*" "^\*")
;;  ido-work-directory-list '("~/" "~/Desktop" "~/Documents" "~src")
;;  ido-case-fold  t                 ; be case-insensitive

;;  ido-enable-last-directory-history t ; remember last used dirs
;;  ido-max-work-directory-list 30   ; should be enough
;;  ido-max-work-file-list      50   ; remember many
;;  ido-use-filename-at-point nil    ; don't use filename at point (annoying)
;;  ido-use-url-at-point nil         ; don't use url at point (annoying)

;;  ido-enable-flex-matching t     ; don't try to be too smart
;;  ido-max-prospects 8              ; don't spam my minibuffer
;;  ido-confirm-unique-completion nil) ; dont wait for RET, even with unique completion


;; when using ido, the confirmation is rather annoying...
(setq confirm-nonexistent-file-or-buffer nil)

;; (require 'filecache)
;; (eval-after-load
;;     "filecache"
;;   '(progn
;;      (message "Loading file cache...")
;;      (file-cache-add-directory-using-find "~/projects")
;;                                      ;(file-cache-add-directory-list load-path)
;;      (file-cache-add-directory "~/org")
;;      ))

;; (defun file-cache-ido-find-file (file)
;;   "Using ido, interactively open file from file cache'.
;; First select a file, matched using ido-switch-buffer against the contents
;; in `file-cache-alist'. If the file exist in more than one
;; directory, select directory. Lastly the file is opened."
;;   (interactive (list (file-cache-ido-read "File: "
;;                                           (mapcar
;;                                            (lambda (x)
;;                                              (car x))
;;                                            file-cache-alist))))
;;   (let* ((record (assoc file file-cache-alist)))
;;     (find-file
;;      (expand-file-name
;;       file
;;       (if (= (length record) 2)
;;           (car (cdr record))
;;         (file-cache-ido-read
;;          (format "Find %s in dir: " file)
;;       (cdr record)))))))

;; (defun file-cache-ido-read (prompt choices)
;;   (let ((ido-make-buffer-list-hook
;;       (lambda ()
;;         (setq ido-temp-list choices))))
;;     (ido-read-buffer prompt)))

;; (defun file-cache-add-this-file ()
;;   (and buffer-file-name
;;        (file-exists-p buffer-file-name)
;;        (file-cache-add-file buffer-file-name)))
;; (add-hook 'kill-buffer-hook 'file-cache-add-this-file)

;; (global-set-key  "\C-xf" 'file-cache-ido-find-file)

;;****************************************************************
; recent files
                                        ;(load-library "~/.emacs.d/lisp/recent.el")
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 10)

(defun recentf-interactive-complete ()
  "find a file in the recently open file using ido for completion"
  (interactive)
  (let* ((all-files recentf-list)
	 (file-assoc-list (mapcar (lambda (x) (cons (file-name-nondirectory x) x)) all-files))
	 (filename-list (remove-duplicates (mapcar 'car file-assoc-list) :test 'string=))
	 (ido-make-buffer-list-hook
	  (lambda ()
	    (setq ido-temp-list filename-list)))
	 (filename (ido-read-buffer "Find Recent File: "))
	 (result-list (delq nil (mapcar (lambda (x) (if (string= (car x) filename) (cdr x))) file-assoc-list)))
	 (result-length (length result-list)))
         (find-file
	  (cond
	   ((= result-length 0) filename)
	   ((= result-length 1) (car result-list))
	   ( t
	     (let ( (ido-make-buffer-list-hook
		     (lambda ()
		       (setq ido-temp-list result-list))))
	       (ido-read-buffer (format "%d matches:" result-length))))
	   ))))

(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;;****************************************************************
;; Unbind Pesky Sleep Button
(global-unset-key [(control z)])
(global-unset-key [(control x)(control z)])
;; Windows Style Undo
(global-set-key [(control z)] 'undo)
(global-set-key [(control x)(control k)]  'kill-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun aruns/smooth-scroll (number)
  (let ( (count 0)
         ( step (cond ((< number 0 ) -1) (t 1))  )
         )
     (dotimes (count (* number step) count)
       (cond ((< step  0)
              (scroll-down 3))
             (t (scroll-up 3))
             )
       (sit-for 0.01)
     )
   )
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "<M-down>") '(lambda()
                                     (interactive)
                                     (aruns/smooth-scroll 9)  ) )

(global-set-key (kbd "<M-up>") '(lambda()
                                    (interactive)
                                    (aruns/smooth-scroll -9)  ) )

(global-set-key (kbd "<M-S-down>") '(lambda()
                                     (interactive)
                                     (aruns/smooth-scroll 4)  ) )

(global-set-key (kbd "<M-S-up>") '(lambda()
                                    (interactive)
                                    (aruns/smooth-scroll -4)  ) )

;;****************************************************************
;;;; folding
(require 'fold)

;; ****************************************************************
;;;; header source toggle
(add-hook 'c-mode-common-hook
          (lambda()
            (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

;;****************************************************************
;; org mode
;; (setq load-path (cons "~/.emacs.d/org-7.01g/lisp" load-path))
;; (require 'org-install)



(global-font-lock-mode 1)                     ; for all buffers
;(add-hook 'org-mode-hook 'turn-on-font-lock)  ; Org buffers only

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(package-initialize)
;(require 'org-macro)
;(require 'org-capture)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command-style
   (quote
    (("" "%(PDF)%(latex) -file-line-error  %S%(PDFout)"))))
 '(TeX-PDF-mode t)
 '(TeX-command-list
   (quote
    (("TeX" "%(PDF)%(tex)  %t" TeX-run-TeX nil
      (latex-mode texinfo-mode ams-tex-mode)
      :help "Run plain TeX")
     ("LaTeX" "%`%l%(mode)'% %t" TeX-run-TeX nil
      (latex-mode doctex-mode)
      :help "Run LaTeX")
     ("Makeinfo" "makeinfo %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with Info output")
     ("Makeinfo HTML" "makeinfo --html %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with HTML output")
     ("AmSTeX" "%(PDF)amstex %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (ams-tex-mode)
      :help "Run AMSTeX")
     ("ConTeXt" "texexec --once --texutil %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt once")
     ("ConTeXt Full" "texexec %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt until completion")
     ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX")
     ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer")
     ("Print" "%p" TeX-run-command t t :help "Print the file")
     ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command)
     ("File" "%(o?)dvips %d -o %f " TeX-run-command t t :help "Generate PostScript file")
     ("Index" "makeindex %s" TeX-run-command nil t :help "Create index file")
     ("Check" "lacheck %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for correctness")
     ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document")
     ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
     ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
     ("Other" "" TeX-run-command t t :help "Run an arbitrary command"))))
 '(TeX-view-program-list
   (quote
    (("sumatrapdfviewer" "c:/apps/pdf/sumatrapdf.exe %o"))))
 '(TeX-view-program-selection
   (quote
    (((output-dvi style-pstricks output-pdf)
      "dvips and start")
     (output-dvi "Yap")
     (output-pdf "sumatrapdfviewer")
     (output-html "start"))))
 '(cc-search-directories
   (quote
    ("." "/usr/include" "/usr/local/include/*" "c:/progra~2/microsoft visual studio 11.0/vc/include" "../src/" "../include" "../test" "../../../../deps/diego/catch" "../../../../deps/eigen/eigen" "~/.biicode/boost/1.57.0")))
 '(company-auto-complete (quote (quote company-explicit-action-p)))
 '(company-backends
   (quote
    (company-c-headers company-irony company-bbdb company-nxml company-css company-eclim company-semantic company-clang company-xcode company-cmake company-capf
                       (company-dabbrev-code company-gtags company-etags company-keywords)
                       company-oddmuse company-files company-dabbrev)))
 '(company-c-headers-path-system
   (quote
    ("C:/Program Files (x86)/Microsoft Visual Studio 11.0/vc/include")))
 '(company-c-headers-path-user
   (quote
    ("." "../include" "../../../../deps/diego/catch" "../../../../deps/eigen/eigen" "~/.biicode/boost/1.57.0")))
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "f3278046d89cd5bc16fbe006a9fdec1d20b4466f12d5e80ee7a92dd4a34ff886" "a4a1dbb04b1e08186a39375df6fa561460239ec3c7821f88ada573b66a80ede7" "e3a3b7d7fe89b5d57d40bc825ca2324875a6f37bd63da66f2a6fc68cc8b2ee95" default)))
 '(desktop-base-file-name "emacs.desktop")
 '(desktop-path (quote ("~" "." "~/.emacs.d/")))
 '(doc-view-continuous t)
 '(doc-view-ghostscript-program "gs.bat")
 '(ede-project-directories (quote ("c:/apps/asti/blocks/svark/asti")))
 '(exec-path
   (quote
    ("C:/apps/bii/bii/" "c:/apps/emacs-24.4/bin/" "c:/apps/git/bin" "c:/apps/python27" "c:/apps/emacs-24.4/lib-src" "c:/apps/emacs-24.4/libexec/emacs/24.4/i686-pc-mingw32" "C:/Users/bnt/Documents/clang-server-1.1.0-x86_64/clang-server/binary" "C:/Users/bnt/Documents/clang-server-1.1.0-x86_64/clang-server/library/x86_64/release" "c:/apps/global/bin" "c:/apps/LLVM/bin" "c:/apps/CMake/bin")))
 '(fill-column 72)
 '(flymake-gui-warnings-enabled nil)
 '(flymake-log-level -1)
 '(flymake-no-changes-timeout 30)
 '(generic-extras-enable-list
   (quote
    (apache-conf-generic-mode apache-log-generic-mode bat-generic-mode inf-generic-mode ini-generic-mode java-manifest-generic-mode java-properties-generic-mode javascript-generic-mode mailagent-rules-generic-mode mailrc-generic-mode rc-generic-mode reg-generic-mode show-tabs-generic-mode)))
 '(global-prettify-symbols-mode t)
 '(global-semantic-decoration-mode nil)
 '(global-semantic-highlight-func-mode nil)
 '(global-semantic-idle-scheduler-mode nil)
 '(global-semantic-stickyfunc-mode nil)
 '(grep-command "findstr /s /i /r /n /c:")
 '(grep-find-command (quote ("findstr /n /r" . 34)))
 '(inhibit-startup-screen t)
 '(irony-lighter " IRNY")
 '(ispell-extra-args (quote ("--sug-mode=ultra")))
 '(ispell-program-name "aspell.exe")
 '(org-agenda-custom-commands
   (quote
    (("d" todo "DONE|DEFERRED|CANCELLED" nil)
     ("w" todo "WAITING" nil)
     ("W" agenda ""
      ((org-agenda-ndays 21)))
     ("A" agenda ""
      ((org-agenda-skip-function
        (lambda nil
          (org-agenda-skip-entry-if
           (quote notregexp)
           "\\=.*\\[#A\\]")))
       (org-agenda-ndays 1)
       (org-agenda-overriding-header "Today's Priority #A tasks: ")))
     ("u" alltodo ""
      ((org-agenda-skip-function
        (lambda nil
          (org-agenda-skip-entry-if
           (quote scheduled)
           (quote deadline)
           (quote regexp)
           "<[^>
]+>")))
       (org-agenda-overriding-header "Unscheduled TODO entries: "))))))
 '(org-agenda-files (quote ("~/org/todo.org" "~/org/toodledo.org")))
 '(org-agenda-ndays 7)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-capture-templates
   (quote
    (("t" "" entry
      (file+headline "~/org/todo.org" "Tasks")
      "* TODO %?  %u" :prepend t)
     ("n" "" entry
      (file+headline "~/org/notes.org" "Notes")
      "* %u %?" :prepend t)
     ("w" "" entry
      (file+headline "~/org/today.org" "Work")
      "* %u %?" :prepend t))))
 '(org-completion-use-ido t)
 '(org-deadline-warning-days 14)
 '(org-default-notes-file "~/org/notes.org")
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-reverse-note-order t)
 '(projectile-generic-command "dir /a:-d /s /O:N /B .")
 '(projectile-global-mode t)
 '(projectile-globally-ignored-files (quote ("TAGS,GTAGS,GPATH,GRTAGS,.gitignore")))
 '(projectile-mode-line-lighter "PRJ")
 '(projectile-tags-command "global -u")
 '(projectile-use-git-grep t)
 '(python-shell-exec-path (quote ("c:/apps/python27/")))
 '(safe-local-variable-values
   (quote
    ((eval instantiate_templates methods spltypes)
     (eval setq spltypes
           (list "bspline<double>" "bspline<pt_t < 2 >> " "bspline<pt_t < 3 >>" "bspline<pt_t < 4 >>"))
     (eval setq methods
           (list "insert_knots" "reparametrize" "split_into_bezier_patches" "is_bezier" "reverse_curve" "foot_param"))
     (eval load-file "./temp.el")
     (eval progn
           (c-set-offset
            (quote innamespace)
            (quote 0))
           (c-set-offset
            (quote inline-open)
            (quote 0))))))
 '(semantic-c-dependency-system-include-path
   (quote
    ("c:\\Program Files (x86)\\Microsoft Visual Studio 11.0\\vc\\include")))
 '(semantic-edits-verbose-flag t)
 '(semantic-idle-scheduler-idle-time 45)
 '(semantic-mode t)
 '(speedbar-use-images nil)
 '(url-debug t)
 '(url-proxy-services
   (quote
    (("http" . "10.5.133.50:8080")
     ("ftp" . "10.5.133.50:8080")
     ("no_proxy" . "^.*10.5.133.50"))))
 '(w3m-command "C:\\apps\\w3m\\bin\\w3m.exe")
 '(yas-trigger-key "C-c <kp-multiply>"))

;;****************************************************************
;;;;;  bury buffer
(global-unset-key [(control tab)])
(global-set-key (kbd "<C-tab>") 'bury-buffer)


(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 250)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)


;;****************************************************************
(add-hook 'abaqus-mode-hook 'turn-on-font-lock)
(autoload 'abaqus-mode "abaqus" "Enter abaqus mode." t)
(setq auto-mode-alist (cons '("\\.inp\\'" . abaqus-mode) auto-mode-alist))

;;****************************************************************
;(require 'breadcrumb)
(require 'bm)
(global-set-key (kbd "<C-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)

;****************************************************************

; (mouse-wheel-mode t) ; dont know what this does
(display-time)
(setq visible-bell t)
; too lazy for yes
(fset 'yes-or-no-p 'y-or-n-p)

;; Turn on debugging (comment this out for normal use)
;(setq debug-on-error t)

;;****************************************************************
;; redo
(require 'redo)
(global-set-key [(control shift z)] 'redo)

;;****************************************************************
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

;;****************************************************************
;; eshell stuff
;; Change the default eshell prompt
 (setq eshell-prompt-function         (lambda ()   " # " " $ "))
;; save history
(setq eshell-save-history-on-exit t)
;;
 (defun eshell/info (subject)
    "Read the Info manual on SUBJECT."
    (let ((buf (current-buffer)))
      (Info-directory)
      (let ((node-exists (ignore-errors (Info-menu subject))))
        (if node-exists
            0
          ;; We want to switch back to *eshell* if the requested
          ;; Info manual doesn't exist.
          (switch-to-buffer buf)
          (eshell-print (format "There is no Info manual on %s.\n"
                                subject))
          1))))

;; less is broken in windows
(defun eshell/less (&rest args)
    "Invoke `view-file' on a file."
    (while args
      (view-file (pop args))))

(defalias 'eshell/more 'eshell/less)

;;****************************************************************
;(require 'igrep)
; smooth scrolling
;(require 'smooth-scrolling)
 ;; scroll one line at a time (less "jumpy" than defaults)

;(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq scroll-conservatively 100)

;;****************************************************************
;; interactive edit
;; you select some text and replace with with C-; to finish call C-;
(require 'iedit)

(define-key global-map (kbd "C-;") 'iedit-mode)
;;
(define-key global-map (kbd "\C-cr") 'regexp-builder)

;(define-key global-map (kbd "\C-x\C-b") 'bs-show)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)
;; dont want to see  ** buffers
(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates "^\\*")
;;****************************************************************
;lock
;(require 'lockcaps)
;(add-hook 'abaqus-mode-hook 'lockcaps-mode )
;(setq grep-find-command '("findstr /s /n /i *.inp /c:\"\"" . 28))

;(setq winring-keymap-prefix "\C-\\")
;(require 'winring)
;(winring-initialize)
;(setq winring-show-names t)
;;****************************************************************
(require 'generic-x)
;;****************************************************************
;(eshell)

(global-set-key "\C-xe"
  (lambda () (interactive) (switch-to-buffer "*eshell*")))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-added ((((background dark)) (:foreground "#FFFF9B9BFFFF")) (t (:foreground "DarkGreen"))))
 '(diff-changed ((((background dark)) (:foreground "Yellow")) (t (:foreground "MediumBlue"))))
 '(diff-context ((((background dark)) (:foreground "White")) (t (:foreground "Black"))))
 '(diff-file-header ((((background dark)) (:foreground "Cyan" :background "Black")) (t (:foreground "Red" :background "White"))))
 '(diff-header ((((background dark)) (:foreground "Cyan")) (t (:foreground "Red"))))
 '(diff-hunk-header ((((background dark)) (:foreground "Black" :background "#05057F7F8D8D")) (t (:foreground "White" :background "Salmon"))))
 '(diff-index ((((background dark)) (:foreground "Magenta")) (t (:foreground "Green"))))
 '(diff-nonexistent ((((background dark)) (:foreground "#FFFFFFFF7474")) (t (:foreground "DarkBlue"))))
 '(diff-removed ((((background dark)) (:foreground "#7474FFFF7474")) (t (:foreground "DarkMagenta"))))
 '(eshell-prompt ((t (:foreground "brown" :weight bold))))
 '(flymake-errline-face ((((class color)) (:background "Brown"))))
 '(flymake-warnline-face ((((class color)) (:background "Blue2"))))
 '(linkd-star-name ((t (:background "lavender" :foreground "dim gray"))))
 '(semantic-decoration-on-unknown-includes ((t (:background "#999000"))))
 '(sr-active-path-face ((t (:background "#474747" :foreground "brown" :weight bold :height 120))))
 '(sr-passive-path-face ((t (:background "#424242" :foreground "gray" :weight bold :height 120)))))

(ansi-color-for-comint-mode-on)

;(require 'lusty-explorer)
;;;;****************************************************************
;<http://www.cabochon.com/~stevey/blog-rants/my-dot-emacs-file.html>
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it is visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

(global-set-key "\C-x\ W" 'rename-file-and-buffer)

;;;****************************************************************
;;; uses C-c left to undo window configuration and C-c right to redo.
(require 'winner)
(winner-mode t)
;;;****************************************************************
;;;Make completion buffers in a shell disappear after 10 seconds.
;(add-hook 'completion-setup-hook
 ;         (lambda () (run-at-time 10 nil
  ;                                (lambda () (delete-windows-on "*Completions*")))))
;; (require 'lcomp)
;; ;(lcomp-install)
;; (lcomp-mode 1)
;;****************************************************************


;;;****************************************************************
;;;_+ Backup configuration
(setq backup-by-copying t)
(setq backup-directory-alist  '(("." . "~/.saves")))
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
(setq version-control t)

;;****************************************************************
;; grep with findstr
(defun wingrep (regexp &optional files dir confirm)
  "Recursively grep for REGEXP in FILES in directory tree rooted at DIR.
The search is limited to file names matching shell pattern FILES.
FILES may use abbreviations defined in `grep-files-aliases', e.g.
entering `ch' is equivalent to `*.[ch]'.
With \\[universal-argument] prefix, you can edit the constructed shell command line
before it is executed.With two \\[universal-argument] prefixes, directly edit and run `grep-find-command'.
Collect output in a buffer.  While find runs asynchronously, you
can use \\[next-error] (M-x next-error), or \\<grep-mode-map>\\[compile-goto-error] \
in the grep output buffer,to go to the lines where grep found matches.
This command shares argument histories with \\[lgrep] and \\[grep-find]."
  (interactive
   (progn
     (grep-compute-defaults)
     (cond
      ((and grep-find-command (equal current-prefix-arg '(16)))
       (list (read-from-minibuffer "Run: " grep-find-command
                                   nil nil 'grep-find-history)))
      ((not grep-find-template)
       (error "grep.el: No `grep-find-template' available"))
      (t (let* ((regexp (grep-read-regexp))
                (files (grep-read-files regexp))
                (dir (read-directory-name "Base directory: "
                                          nil default-directory t))
                (confirm (equal current-prefix-arg '(4))))
           (list regexp files dir confirm))))))
  (when (and (stringp regexp) (> (length regexp) 0))
    (unless (and dir (file-directory-p dir) (file-readable-p dir))
      (setq dir default-directory))
    (if (null files)
        (if (not (string= regexp grep-find-command))
            (compilation-start regexp 'grep-mode))
      (setq dir (file-name-as-directory (expand-file-name dir)))
          (let ((command  (concat "findStr /S /R /I /N /C:\""
                                  regexp
                                  "\"  /D:\""
                                   dir
                                  "\" "
                                  files
                           )
                      ))
        (when command
          (if confirm
              (setq command
                    (read-from-minibuffer "Confirm: "
                                          command nil nil 'grep-find-history))
            (add-to-history 'grep-find-history command))
          (let ((default-directory dir))
              (compilation-start command 'grep-mode)
              )

          ;; Set default-directory if we started rgrep in the *grep* buffer.
          (if (eq next-error-last-buffer (current-buffer))
              (setq default-directory dir)))))))

;;****************

;;****************************************************************
;; magit
(add-to-list 'load-path "~/.emacs.d/magit")
(require 'magit)

;;****************************************************************
;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; enable reftex with AUCTeX LaTeX mode
;; (setq reftex-plug-into-AUCTeX t)
;;****************************************************************

;; autoload configuration
;; (Not required if you have installed Wanderlust as XEmacs package)
;(autoload 'wl "wl" "Wanderlust" t)
;(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
;(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;; Directory where icons are placed.
;; Default: the peculiar value to the running version of Emacs.
;; (Not required if the default value points properly)
;(setq wl-icon-directory "~/work/wl/etc")

;; SMTP server for mail posting. Default: nil
;(setq wl-smtp-posting-server "CORP-TOK-EXB04.ds")
;; NNTP server for news posting. Default: nil
;(setq wl-nntp-posting-server "your.nntp.example.com")

;;****************************************************************
;; GTAGS
(add-hook 'c-mode-common-hook
  (lambda ()
    (require 'ggtags)
    (ggtags-mode t)
))

; intel debugger-- does not work yet


;;****************************************************************
;; ediff
;(setq ediff-make-buffers-readonly-at-startup t)
;; only hilight current diff:
;(setq-default ediff-highlight-all-diffs 'nil)
;; i want the ediff command window inline
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)


;;; abaqus

;;;;;**************************************************************************
;;;; type a complex command you want to run repeatedly and then press C-xzzzzzzzzzzz...
;;;; to repeat the command as often as you want
;; (require 'vi-dot)
;; (global-set-key  "\C-xz" 'vi-dot)

;(require 'w32shell)
;(require 'emacsw32)
;;;; guiLog in python mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(require 'anything)
;(require 'anything-match-plugin nil t)
;(require 'anything-include)
;; (require 'linkd)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; aruns: some code stolen from simple.el
(defun file-backups (filename)
  "Return  backup files for FILENAME"
  ;; `make-backup-file-name' will get us the right directory for
  ;; ordinary or numeric backups.  It might create a directory for
  ;; backups as a side-effect, according to `backup-directory-alist'.
  (let* ((filename (file-name-sans-versions
                    (make-backup-file-name (expand-file-name filename))))
         (file (concat (file-name-nondirectory filename) ".~") )
         (dir  (file-name-directory    filename))
         )
    (progn
       (mapcar
        (lambda(x) (concat dir x ) )
        (sort
         (file-name-all-completions file dir)
         'file-newer-than-file-p
        )
      )
    )
  )
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'desktop)
(setq desktop-buffers-not-to-save
      (concat "\\("
              "^nn\\.a[0-9]+\\|\\.log\\|(ftp)\\|^tags\\|^TAGS"
              "\\|\\.diary\\|\\.newsrc-dribble\\|\\.bbdb"
              "\\)$"))

(add-to-list 'desktop-modes-not-to-save 'dired-mode)
(add-to-list 'desktop-modes-not-to-save 'Info-mode)
(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
(add-to-list 'desktop-modes-not-to-save 'fundamental-mode)

(put 'narrow-to-region 'disabled nil)

(require 'ntcmd)
(add-to-list 'auto-mode-alist '("\\.bat\\'" . ntcmd-mode))
(add-to-list 'auto-mode-alist '("\\.cmd\\'" . ntcmd-mode))

;(add-to-list 'load-path "~/.emacs.d/cedet-1.0/common")

(require 'semantic)
;(require 'semanticdb)
;; (semantic-mode 1)
;; (global-semanticdb-minor-mode 1)
;; ;(require 'semantic-ia)
;; ;; if you want to enable support for gnu global
;; (require 'semanticdb-global)
;; (semanticdb-enable-gnu-global-databases 'c-mode)
;; (semanticdb-enable-gnu-global-databases 'c++-mode)
;(semantic-stickyfunc-mode t)

;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
;(global-srecode-minor-mode 1)            ; Enable template insertion menu

;(semantic-load-enable-code-helpers)
;(setq semantic-load-turn-useful-things-on t)

 ;; (defun add-includes-in-directory (dir)
 ;;  "Add all header files in DIR to `semanticdb-implied-include-tags'."
 ;;  (let ((files (directory-files dir t "^.+\\.h[hp]*$" t)))
 ;;    (defvar-mode-local c++-mode semanticdb-implied-include-tags
 ;;      (mapcar (lambda (header)
 ;;             (semantic-tag-new-include
 ;;              header
 ;;              nil
 ;;              :filename header))
 ;;           files))))

(defun remove-duplicate-lines()
  "Remove duplicate lines in a buffer"
  (interactive)
  (save-excursion
    (let
        ((lines_hash (make-hash-table :test #'equal))
         (numlines (count-lines 1 (progn (end-of-buffer)(point)))))

      ;; Make a hash table with key=line
      ;;     and value=the smallest line number that contains a line.
      (loop for i from numlines downto 1 do
           (let ((line nil))
             (goto-line i)
             (setf line (get-current-line))
             ;; Want to store the smallest line number for
             ;;     a particular line.
             (setf (gethash line lines_hash) i)))
      ;; If a line has a line number not equal to the smallest line, kill it.
      (loop for i from numlines downto 1 do
           (let ((line nil))
             (goto-line i)
             (setf line (get-current-line))
             (beginning-of-line)
             (if (not (equal line ""))
                 (if (not (=
                           (let ((min-line (gethash line lines_hash)))
                             (if (null min-line)
                                 -1
                               min-line))
                           i))
                     (kill-line 1))))))))

(defmacro get-current-line()
  "Current line string"
  (buffer-substring (save-excursion (beginning-of-line) (point))
            (save-excursion (end-of-line) (point))))

;; (require 'auto-complete)
;; (global-auto-complete-mode nil)



;(require 'auto-indent-mode)
;(require 'sr-speedbar)

;; copy file path to clipboard
(defun copy-full-path-to-kill-ring ()
  "copy buffer's full path to kill ring"
  (interactive)
  (when buffer-file-name
    (kill-new (file-truename buffer-file-name))))

(tool-bar-mode t)
(require 'hideshow-org)

(global-set-key "\C-ch" 'hs-org/minor-mode)

(defun refresh-file ()
  (interactive)
  (revert-buffer t (not (buffer-modified-p)) t)
  )

(global-set-key [(meta f5)] 'refresh-file)

(require 'diff-mode-)
;(require 'cc-mode+)

;(require 'doc-mode)
;(add-hook 'c-mode-common-hook 'doc-mode)

(require 'rainbow-delimiters)
(setq-default frame-background-mode 'dark)
;;(require 'astyle-hooks)#
; (load-file "~/.emacs.d/astyle-hooks.el")
;(require 'flymake-helper)
(put 'narrow-to-page 'disabled nil)
(require 'fill-column-indicator)
;; (require 'yasnippet)
;; (setq yas/root-directory "~/.emacs.d/snippets")
;; (setq yas/trigger-key (kbd "C-c <kp-multiply>"))
;; (yas/initialize)
;; (yas/load-directory yas/root-directory)
(require 'ffap)
(global-set-key [S-mouse-3] 'ffap-at-mouse)

; _ is not a word separator in c++
;(modify-syntax-entry ?_ "w" c++-mode-syntax-table)

(defun add-const-tag ()
  (interactive)
  (save-excursion
    (backward-word 1)
    (insert "const ")
    )
)
(defalias 'qrr 'query-replace-regexp)

;(load "~/.emacs.d/haskell-mode-2.8.0/haskell-site-file")

;; (defun haskell-style ()
;;   "Sets the current buffer to use Haskell Style. Meant to be
;;   added to `haskell-mode-hook'"
;;   (interactive)
;;   (setq tab-width 4
;;         haskell-indentation-layout-offset 4
;;         haskell-indentation-left-offset 4
;;         haskell-indentation-ifte-offset 4))

;; (add-hook 'haskell-mode-hook 'haskell-style)
;;(add-to-list 'load-path "~/.emacs.d/el-get/el-get-master")
;;(require 'el-get)
;(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;(require 'tex-mik)
;(add-to-list 'load-path "~/emacs.d/flim-1.14.9/" )
;; (require 'url)
;; (require 'url-http-ntlm)
(require 'server)

(when (and (>= emacs-major-version 23)
           (equal window-system 'w32))
  (defun server-ensure-safe-dir (dir) "Noop" t)) ; Suppress error "directory
                                                 ; ~/.emacs.d/server is unsafe"
                                                 ; on windows.
(unless (server-running-p) (server-start))


(defun inject-include()
   (interactive)
   (end-of-buffer)
   (search-backward "#include")
   (move-end-of-line 1)
   (newline)
   (insert  "#include <accumAndPrint.h>")
   (newline)
)

(require 'visual-basic-mode)
(autoload 'visual-basic-mode "visual-basic-mode" "Visual Basic mode." t)
(add-to-list 'auto-mode-alist '("\\.vbs\\'" . visual-basic-mode)) ; VBscript
(add-to-list 'auto-mode-alist '("\\.vb\\'" . visual-basic-mode))  ; visual basic .NET file
(add-to-list 'auto-mode-alist '("\\.bas\\'" . visual-basic-mode)) ; visual basic form
(add-to-list 'auto-mode-alist '("\\.frm\\'" . visual-basic-mode)) ; basic language source
(add-to-list 'auto-mode-alist '("\\.cls\\'" . visual-basic-mode)) ; C++ class definition file


(global-set-key (kbd "\C-c >" ) 'fold-toggle)

;(require 'yasnippet)
;(yas-global-mode 1)
;(global-set-key (kbd "\C-cc") 'create-auto-yasnippet)
;(global-set-key (kbd "\C-cy") 'expand-auto-yasnippet)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;(global-set-key "\C-cl" 'org-store-link)
;(global-set-key "\C-ca" 'org-agenda)
;(global-set-key "\C-cb" 'org-iswitchb)
(add-hook 'org-mode-hook (lambda ()
                           (local-set-key [(control tab)] 'bury-buffer)))

(define-key mode-specific-map [?a] 'org-agenda)
(define-key mode-specific-map [?l] 'org-store-link)
(define-key mode-specific-map [?b] 'org-switchb)
(require 'org-id)
(eval-after-load "org"
  '(progn
     (define-prefix-command 'org-todo-state-map)

     (define-key org-mode-map "\C-cx" 'org-todo-state-map)

     (define-key org-todo-state-map "x"
       #'(lambda nil (interactive) (org-todo "CANCELLED")))

     (define-key org-todo-state-map "d"
       #'(lambda nil (interactive) (org-todo "DONE")))

     (define-key org-todo-state-map "f"
       #'(lambda nil (interactive) (org-todo "DEFERRED")))

     (define-key org-todo-state-map "s"
       #'(lambda nil (interactive) (org-todo "STARTED")))
     (define-key org-todo-state-map "w"
       #'(lambda nil (interactive) (org-todo "WAITING")))

;     (define-key org-agenda-mode-map "\C-n" 'next-line)
 ;    (define-key org-agenda-keymap "\C-n" 'next-line)
  ;   (define-key org-agenda-mode-map "\C-p" 'previous-line)
   ;  (define-key org-agenda-keymap "\C-p" 'previous-line)
))

;; (require 'remember)
;; (add-hook 'remember-mode-hook 'org-remember-apply-template)
(define-key global-map [(control meta ?r)] 'org-capture)

;; helper to include images in org files.
(defun org-dblock-write:image (params)
  (let ((file (plist-get params :file)))
    (clear-image-cache file)
    (insert-image (create-image file) ))
  )
(require 'whitespace)
;(whitespace-mode t)
  (setq whitespace-style '(face empty tabs lines-tail trailing))
  (global-whitespace-mode t)


(defun my:disable-flymake-in-semantic-background ()
  (defadvice semanticdb-create-table-for-file-not-in-buffer
      (around my:disable-flymake activate)
    (letf* ((my:semantic-file-name (ad-get-arg 0))
            ((symbol-function 'my:orig-flymake-can-syntax-check-file)
             (symbol-function 'flymake-can-syntax-check-file))
            ((symbol-function 'flymake-can-syntax-check-file)
             (lambda (file-name)
               (and (not (equal file-name my:semantic-file-name))
                    (my:orig-flymake-can-syntax-check-file file-name)))))
      ad-do-it)))
(eval-after-load 'semantic-fw
  '(eval-after-load 'flymake '(my:disable-flymake-in-semantic-background)))



(setq show-paren-style 'expression)
(require 'list-processes+)

(when (require 'deft nil 'noerror)
   (setq
      deft-extension "org"
      deft-directory "~/Org/"
      deft-text-mode 'org-mode)
   (global-set-key (kbd "<f9>") 'deft))
;(add-hook 'c-mode-common-hook 'openfoam-hgw-c-mode-hook)

(setq-default indent-tabs-mode nil)
(require 'tempo)
(require 'tempo-c-cpp)


(tempo-define-template "c-template"
                       '(> "template <class " ~ ">"  n>
                         )
                       "templf"
                       "Insert a template"
                       'c-tempo-tags)

(require 'cc-mode)
(c-add-style "my-style"
             '("stroustrup"
               (indent-tabs-mode . nil)        ; use spaces rather than tabs
               (c-basic-offset . 4)            ; indent by four spaces
               (tab-width .  4)
               (c-offsets-alist . ((inline-open . 0)  ; custom indentation rules
                                   (brace-list-open . 0)
                                   (innamespace . [0])
                                   (statement-case-open . +)))))

(add-hook 'c-mode-hook (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

(require 'irony)
(setq w32-pipe-read-delay 0)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(require 'linkd)
(defun my-c++-mode-hook ()
  (c-set-style "my-style")        ; use my-style defined above
  (auto-fill-mode)
  (local-set-key "\C-m" 'newline-and-indent)
  (if buffer-file-name (progn
                         (let* ((is-workdir t )
                                (extn (file-name-extension buffer-file-name))
                                (is-source (not (eq (string-match "C\\|c" extn ) nil ) ))
                                )
                           (if is-workdir (progn
;                                                 (linkd-mode t)
                                                 (require 'fillcode)
                                                 (fillcode-mode t)
                                                 (require 'projectile)
                                                 (projectile-mode t)
                                                 (irony-mode t)
                                                 (require 'company)
                                                 (company-mode t)
;                                                 (add-to-list 'company-backends 'company-c-headers)
                                                 ) )
                           )
                         )
    )                                        ;  (c-toggle-auto-hungry-state 1)
  )


(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(require 'projectile)
(setq projectile-enable-caching t)
(defvar smart-operator-double-space-docs nil
  "Enable double spacing of . in document lines - e,g, type '.' => get '.  '")


                                        ;(require 'radiance-theme)
(color-theme-inkpot)
;;(require 'CDLatex)

(require 'imenu)

(require 'cc-mode)
(add-to-list 'c++-font-lock-extra-types "auto")
(modify-syntax-entry ?_ "w" c++-mode-syntax-table)
(require 'fillcode)
;(require 'helm)

(add-to-list 'load-path "~/.emacs.d/helm/helm-master")
;(require 'helm-config)
(require 'helm)
;(helm-projectile-on)
(require 'heartbeat)


; Add cmake listfile names to the mode list.
(setq auto-mode-alist
          (append
           '(("CMakeLists\\.txt\\'" . cmake-mode))
           '(("\\.cmake\\'" . cmake-mode))
           auto-mode-alist))

(require 'cmake-mode)
(require 'projectile)

(add-to-list 'load-path "~/.emacs.d/cppref-master")
(require 'cppref)
(setq cppref-doc-dir "c:/apps/cppref/reference")
(require 'ack-and-a-half)
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)
;(require 'leuven-theme)

(require 'package)
;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
;; You might already have this line
(require 'nyan-mode)
(nyan-mode t)

;; (require 'ac-clang)

;; (setq w32-pipe-read-delay 0)          ;; <- Windows Only

;; (when (ac-clang-initialize)
;;     (add-hook 'c-mode-common-hook '(lambda ()
;;                                      (setq ac-clang-cflags "-I../include -std=c++11 -stdlib=libc++")
;;                                      (ac-clang-activate-after-modify))))

;; (require 'color-theme)
;; (require 'color-theme-solarized)
;; (color-theme-solarized-light  )

(require 'flymake)

(defun flymake-asti-c-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (replace-regexp-in-string "/" "\\\\" (expand-file-name temp-file) ) )
         )
    (progn
      ;(message "local-file: %s" local-file)
      (list "C:\\Windows\\system32\\cmd.exe" (list "/c" "c:\\apps\\bii\\syn.bat"
                           local-file
                           )
      )
    )
    )
  )


(setq flymake-allowed-file-name-masks (quote ( (".+\\.cpp$"
                                                flymake-asti-c-init flymake-simple-cleanup
                                                flymake-get-real-file-name) ;(".+\\.c$" 1) (".+\\.cpp$" 1)
                                               (".+\\.java$" 3) (".+\\.h$" 2 (".+\\.cpp$" ".+\\.c$")
                                                                 ("[ ]*#[]*include[ ]*\"\\([w0-9/\\_.]*[/\\]*\\)\\(%s\\)\"" 1 2))
                                               (".+\\.idl$" 1)
                                               (".+\\.odl$" 1)
                                               (".+[0-9]+\\.tex$" 2 (".+\\.tex$")
                                                ("[ ]*\\input[]*{\\(.*\\)\\(%s\\)}" 1 2))
                                               (".+\\.tex$" 1))))

(add-hook 'flymake-mode-hook (function (lambda()
                                         (local-set-key [C-f4] 'flymake-goto-next-error)))
)

(require 'semantic)
(semanticdb-enable-gnu-global-databases 'c++-mode)
(semantic-mode)
(require 'ffap)
(setq ffap-c++-path
      (list "c:/apps/asti/blocks/svark/asti/include"
            "c:/Progra~2/Micros~3.0/vc/include"
            "c:/apps/asti/blocks/svark/asti/src"
            "c:/progra~2/Microsoft Visual Studio 11.0/vc/include"
            ))

(require 'function-args)

(fa-config-default)
(define-key c-mode-map  [(control tab)] 'moo-complete)
(define-key c++-mode-map  [(control tab)] 'moo-complete)
(define-key c-mode-map (kbd "M-o")  'fa-show)
(define-key c++-mode-map (kbd "M-o")  'fa-show)

(require 'company-irony-c-headers)
   ;; Load with `irony-mode` as a grouped backend

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

(require 'ivy)
(ivy-mode t)
(setq projectile-completion-system 'ivy)
                                        ;(linkd-mode 0)
;; (require 'powerline)
;; (powerline-center-theme )

;(color-theme-solarized-light)
(load "C:/apps/LLVM/share/clang/clang-format.el")
(global-set-key [C-M-tab] 'clang-format-region)
