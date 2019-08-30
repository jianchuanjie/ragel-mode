;;; init-ragel-mode.el --- sample major mode for ragel -*- coding: utf-8; lexical-binding: t; -*-

;;; Commentary:

;;; code:


(setq ragel-mode-font-lock-keywords
      (let* (
             ;;define several keywords
             (x-keywords '("machine" "action" "access" "context" "include" "import" "export" "prepush" "postpop" "when" "inwhen" "outwhen" "err" "lerr" "eof" "from" "to" "alphtype" "getkey" "write"))
             (x-constants '("any" "ascii" "extend" "alpha" "digit" "alnum" "lower" "upper" "xdigit" "cntrl" "graph" "print" "punct" "space" "zlen" "empty"))
             (x-events '("fpc" "fc" "fcurs" "fbuf" "fblen" "ftargs" "fstack" "fhold" "fgoto" "fcall" "fret" "fentry" "fnext" "fexec" "fbreak"))

             ;; generate regex string for each category of keywords
             (x-keywords-regex (regexp-opt x-keywords 'words))
             (x-constants-regex (regex-opt x-constants 'words))
             (x-events-regex (regex-opt x-events) 'words)))
      `(
        (,x-keywords-regex . font-lock-keyword-face)
        (,x-constants-regex . font-lock-constant-face)
        (,x-events-regex . font-lock-builtin-face)
        ;; FIXME: order is important ?
        ))

;;;###autoload
(define-derived-mode ragel-mode cc-mode "ragel-mode"
  "Major mode for ediring ragel files"

  ;; code for syntax highlighting
  (setq font-lock-defaults '((ragel-mode-font-lock-keywords)))
  )


(provide 'init-ragel-mode)

;;; init-ragel-mode.el ends here
