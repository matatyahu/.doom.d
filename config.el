;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Matheus Barcellos"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 14 :weight 'semi-light))
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(after! org (setq org-directory "~/org"
                  org-agenda-files (list "inbox.org" "projects.org" "agenda.org")
                  ;; Capture template for inbox
                  org-capture-templates `(("i" "Inbox" entry (file "inbox.org")
                                           ,(concat "* TODO %?\n"
                                                    "/Entered on/ %U"))
                                          ("m" "Meeting" entry  (file+headline "agenda.org" "Future")
                                           ,(concat "* %? :meeting:\n"
                                                    "<%<%Y-%m-%d %a %H:00>>")))
                  ;;Formatting for todo list
                  org-agenda-hide-tags-regexp "."
                  org-agenda-prefix-format '((agenda . " %i %-12:c%?-12t% s")
                                             (todo   . " ")
                                             (tags   . " %i %-12:c")
                                             (search . " %i %-12:c"))
                  ;;Syntax for refiling
                  org-refile-targets '(("projects.org" :regexp . "\\(?:\\(?:Note\\|Task\\)s\\)"))
                  org-refile-use-outline-path 'file
                  org-outline-path-complete-in-steps nil
                  org-agenda-custom-commands
                  '(("g" "Get Things Done (GTD)"
                     ((agenda ""
                              ((org-agenda-start-day "-0d")
                               (org-agenda-span 1)
                               (org-agenda-skip-function
                                '(org-agenda-skip-entry-if 'deadline))
                               (org-deadline-warning-days 0)))
                      (todo "NEXT"
                            ((org-agenda-skip-function
                              '(org-agenda-skip-entry-if 'deadline))
                             (org-agenda-prefix-format "  %i %-12:c [%e] ")
                             (org-agenda-overriding-header "\nTasks\n")))
                      (agenda nil
                              ((org-agenda-start-day "-0d")
                               (org-agenda-span 1)
                               (org-agenda-entry-types '(:deadline))
                               (org-agenda-format-date "")
                               (org-deadline-warning-days 7)
                               (org-agenda-overriding-header "\nUpcoming Deadlines")))
                      (tags-todo "inbox"
                                 ((org-agenda-prefix-format "  %?-12t% s")
                                  (org-agenda-overriding-header "\nInbox\n")))
                      (tags "CLOSED>=\"<today>\""
                            ((org-agenda-overriding-header "\nCompleted today\n"))))))))


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)





;;Agenda shenenigans

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
