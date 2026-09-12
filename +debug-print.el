;;; +debug-print.el -*- lexical-binding: t; -*-
;;
;; Debug-print insertion and cleanup (refactoring.nvim's debug-print suite,
;; trimmed to what this config actually used). Bound under SPC c p (see
;; +bindings.el). Every print carries the DBG: marker so
;; `+debug-print/cleanup' can strip them. Printf-style templates assume
;; numeric-ish expressions (see the C/C++/Zig casts); expressions are
;; interpolated verbatim without language-aware escaping.

(defconst +debug-print-marker "DBG:")

;; Format strings per canonical major mode: :var takes (NAME NAME),
;; :loc takes (FILE LINE). A \\n in a template is the target language's
;; backslash-n, not an Elisp newline. Native tree-sitter modes are
;; normalized onto these by `+debug-print--canonical-mode'.
(defvar +debug-print--templates
  '((python-mode
     :var "print(f\"DBG: {%s=}\")"
     :loc "print(f\"DBG: %s:%d\")")
    (c-mode
     :var "printf(\"DBG: %s: %%ld\\n\", (long)(%s));"
     :loc "printf(\"DBG: %s:%d\\n\");")
    (c++-mode
     :var "std::cout << \"DBG: %s: \" << (%s) << '\\n';"
     :loc "std::cout << \"DBG: %s:%d\" << '\\n';")
    (cuda-mode
     :var "printf(\"DBG: %s: %%ld\\n\", (long)(%s));"
     :loc "printf(\"DBG: %s:%d\\n\");")
    (zig-mode
     :var "std.debug.print(\"DBG: %s: {any}\\n\", .{%s});"
     :loc "std.debug.print(\"DBG: %s:%d\\n\", .{});")
    (sh-mode
     :var "echo \"DBG: %s=$%s\""
     :loc "echo \"DBG: %s:$LINENO\"")
    (lua-mode
     :var "print(\"DBG: %s=\" .. tostring(%s))"
     :loc "print(\"DBG: %s:%d\")")
    (emacs-lisp-mode
     :var "(message \"DBG: %s=%%S\" %s)"
     :loc "(message \"DBG: %s:%d\" (buffer-name) (line-number-at-pos))")))

(defun +debug-print--canonical-mode ()
  "Canonical template mode for the current major mode."
  (pcase major-mode
    (`python-ts-mode 'python-mode)
    (`c-ts-mode 'c-mode)
    (`c++-ts-mode 'c++-mode)
    (`cuda-ts-mode 'cuda-mode)
    (`lua-ts-mode 'lua-mode)
    (`bash-ts-mode 'sh-mode)
    (_ major-mode)))

(defun +debug-print--template ()
  (or (assq (+debug-print--canonical-mode) +debug-print--templates)
      (user-error "No debug print template for %s" major-mode)))

(defun +debug-print--format (key &rest args)
  (apply #'format (plist-get (cdr (+debug-print--template)) key) args))

(defun +debug-print--insert-after-line (text)
  "Insert TEXT on its own line after the current one, at the same indent."
  (let ((indent (save-excursion
                  (beginning-of-line)
                  (buffer-substring (point) (progn (back-to-indentation) (point))))))
    (end-of-line)
    (insert "\n" indent text)))

(defun +debug-print--insert-before-line (text)
  "Insert TEXT on its own line before the current one, at the same indent."
  (let ((indent (save-excursion
                  (beginning-of-line)
                  (buffer-substring (point) (progn (back-to-indentation) (point))))))
    (beginning-of-line)
    (insert indent text "\n")))

(defun +debug-print--word ()
  (or (thing-at-point 'symbol t)
      (user-error "No symbol at point")))

(defun +debug-print--region-or-prompt (prompt)
  (if (use-region-p)
      (buffer-substring-no-properties (region-beginning) (region-end))
    (read-string prompt)))

(defun +debug-print--insert (kind placement)
  "Insert a print. KIND is :var, :expr or :loc; PLACEMENT is :below or :above."
  (let* ((line (line-number-at-pos))
         (file (if buffer-file-name
                   (file-name-nondirectory buffer-file-name)
                 (buffer-name)))
         (text
          (pcase kind
            (:var (let ((w (+debug-print--word)))
                    (+debug-print--format :var w w)))
            (:expr (let ((e (+debug-print--region-or-prompt "Expression: ")))
                     (+debug-print--format :var e e)))
            (:loc (+debug-print--format :loc file line)))))
    (if (eq placement :above)
        (+debug-print--insert-before-line text)
      (+debug-print--insert-after-line text))))

(defun +debug-print/var-below ()
  (interactive) (+debug-print--insert :var :below))

(defun +debug-print/var-above ()
  (interactive) (+debug-print--insert :var :above))

(defun +debug-print/expr-below ()
  (interactive) (+debug-print--insert :expr :below))

(defun +debug-print/expr-above ()
  (interactive) (+debug-print--insert :expr :above))

(defun +debug-print/loc-below ()
  (interactive) (+debug-print--insert :loc :below))

(defun +debug-print/loc-above ()
  (interactive) (+debug-print--insert :loc :above))

(defun +debug-print/cleanup ()
  "Delete every line in the buffer containing the DBG: marker.
Matches any such line, including manually written ones."
  (interactive)
  (save-excursion
    (save-restriction
      (widen)
      (flush-lines (regexp-quote +debug-print-marker) (point-min) (point-max)))))
