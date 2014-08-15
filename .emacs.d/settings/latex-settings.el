;-----------;
;;; LaTeX ;;;
;-----------;

; auctex
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(include-elget-plugin "auctex")
(load "auctex.el" nil t t)

; basic configuration
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
;(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'linum-mode)

; start reftex-mode
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

; spell checking
(setq ispell-program-name "aspell")
(setq ispell-dictionary "english")
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-buffer)

; enable pdf mode (pdflatex) by default
(setq TeX-PDF-mode t) ; OR
;; (require 'tex)
;; (TeX-global-PDF-mode t)

; custome LaTex command with -shell-escape option.
; useful for converting eps to pdf
(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
                '("LaTeX" "%`%l -shell-escape  %(mode)%' %t"
                  TeX-run-command nil t)))

; always start the server for inverse search
(setq TeX-source-correlate-mode t)
(setq-default TeX-source-correlate-start-server t)

; preview latex quations, referrence, figures etc.
(load "preview-latex.el" nil t t)
; set preview programs
(setq TeX-view-program-list
      '(("SumatraPDF" "SumatraPDF.exe %o") ; windows
        ("Gsview" "gsview32.exe %o") ; windows
        ("Okular" "okular --unique %o")
        ("Evince" "evince --page-index=%(outpage) %o")
        ("Firefox" "firefox %o")
        ("Skim"
         (concat
          "/Applications/Skim.app/Contents/SharedSupport/displayline"
          " %n %o %b")) ; mac
        ))

; System specific settings
(if (system-is-mac)
    (progn
      (require 'tex-site)
      (require 'font-latex)
      (setq TeX-view-program-selection
            (quote (((output-dvi style-pstricks) "dvips and gv")
                    (output-dvi "xdvi")
                    (output-pdf "Skim")
                    (output-html "xdg-open")))))

  (if (system-is-linux)
      (setq TeX-view-program-selection
            (quote (((output-dvi style-pstricks) "dvips and gv")
                    (output-dvi "xdvi")
                    (output-pdf "Evince")
                    (output-html "xdg-open"))))))

; predictive mode
(include-elget-plugin "predictive")
(require 'predictive)
(autoload 'predictive-mode "predictive" "predictive" t)
(add-hook 'LaTeX-mode-hook 'predictive-mode)
(set-default 'predictive-auto-add-to-dict t)
(setq predictive-main-dict 'rpg-dictionary
      predictive-auto-learn t
      predictive-add-to-dict-ask nil
      predictive-use-auto-learn-cache nil
      predictive-which-dict t)

;; Support Zotero library with zotelo.el
(require 'zotelo)
(add-hook 'TeX-mode-hook 'zotelo-minor-mode)
; (setq zotelo--auto-update-is-on t)

; A pretty interface to auctex completions
(require 'auto-complete-auctex)

(provide 'latex-settings)
