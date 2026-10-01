;;; +lang-extras.el -*- lexical-binding: t; -*-

(setq-default tab-width 2
              indent-tabs-mode nil)

(add-hook! '(python-mode-hook python-ts-mode-hook
             c-mode-hook c-ts-mode-hook c++-mode-hook c++-ts-mode-hook)
  (setq-local tab-width 4))

(add-hook 'c-mode-common-hook
          (defun +lang-extras--c-indent-h ()
            (setq-local c-basic-offset 4)))

(setq-hook! '(c-ts-mode-hook c++-ts-mode-hook)
  c-ts-mode-indent-offset 4)

(defvar-local +julia--treesit-font-lock-added nil)

(defun +julia--treesit-font-lock-h ()
  "Highlight Julia calls, variable uses, properties, and punctuation."
  (unless +julia--treesit-font-lock-added
    (setq-local treesit-font-lock-settings
                (append
                 treesit-font-lock-settings
                 (treesit-font-lock-rules
                  :language 'julia :feature 'dustveil-syntax :override nil
                  '((call_expression
                     [(identifier) (operator)] @font-lock-function-call-face)
                    (call_expression
                     (field_expression "."
                                       [(identifier) (operator)] @font-lock-function-call-face))
                    (call_expression
                     (parenthesized_expression
                      [(identifier) (operator)] @font-lock-function-call-face))
                    (field_expression "." (identifier) @font-lock-property-use-face)
                    (["(" ")" "[" "]" "{" "}" "," ";"] @font-lock-punctuation-face))
                  :language 'julia :feature 'dustveil-variables :override nil
                  '((identifier) @font-lock-variable-use-face)))
                treesit-font-lock-feature-list
                (copy-tree treesit-font-lock-feature-list))
    (cl-pushnew 'dustveil-syntax (nth 2 treesit-font-lock-feature-list))
    (cl-pushnew 'dustveil-variables (nth 2 treesit-font-lock-feature-list))
    (treesit-font-lock-recompute-features)
    (setq +julia--treesit-font-lock-added t)
    (font-lock-flush)))

(add-hook 'julia-ts-mode-hook #'+julia--treesit-font-lock-h)

(defvar-local +ess-r--treesit-font-lock-added nil)

(defun +ess-r--treesit-font-lock-h ()
  "Fill R identifier captures and distinguish parameters from their values."
  (unless +ess-r--treesit-font-lock-added
    (setq-local treesit-font-lock-settings
                (append
                 treesit-font-lock-settings
                 (treesit-font-lock-rules
                  :language 'r :feature 'dustveil-variables :override nil
                  '((identifier) @font-lock-variable-use-face)
                  :language 'r :feature 'dustveil-syntax :override t
                  '((parameters
                     (parameter name: (identifier) @dustveil-parameter-face))
                    (arguments
                     (argument name: (identifier) @dustveil-parameter-face))
                    (namespace_operator lhs: (identifier) @font-lock-type-face)
                    (call function:
                          (namespace_operator rhs: (identifier) @font-lock-function-call-face))
                    (call function:
                          (extract_operator rhs: (identifier) @font-lock-function-call-face))
                    (binary_operator
                     lhs: (identifier) @font-lock-function-name-face
                     operator: ["<-" "<<-" "="]
                     rhs: (function_definition))
                    (Binary_operator
                     lhs: (function_definition)
                     operator: ["->" "->>"]
                     rhs: (identifier) @font-lock-function-name-face))))
                treesit-font-lock-feature-list
                (copy-tree treesit-font-lock-feature-list))
    (cl-pushnew 'dustveil-variables (nth 2 treesit-font-lock-feature-list))
    (cl-pushnew 'dustveil-syntax (nth 2 treesit-font-lock-feature-list))
    (treesit-font-lock-recompute-features)
    (setq +ess-r--treesit-font-lock-added t)
    (font-lock-flush)))

(add-hook 'r-ts-mode-hook #'+ess-r--treesit-font-lock-h)

(defun +ess-r--argument-kind (opening)
  "Identify a function parameter list or call argument list at OPENING."
  (when (and opening (eq (char-after opening) ?\())
    (save-excursion
      (goto-char opening)
      (while (forward-comment -1))
      (cond
       ((eq (char-before) ?\\) 'parameter)
       ((memq (char-syntax (or (char-before) ?\s)) '(?w ?_ ?\) ?\" ?|))
        (let ((end (point)))
          (ignore-errors (backward-sexp))
          (let ((head (buffer-substring-no-properties (point) end)))
            (cond ((equal head "function") 'parameter)
                  ((not (member head '("if" "for" "while"))) 'argument)))))))))

(defun +ess-r--identifier-face ()
  "Choose an R identifier face using syntax, without resolving bindings."
  (save-excursion
    (save-match-data
      (let* ((start (match-beginning 0))
             (end (match-end 0))
             (state (syntax-ppss start)))
        (unless (or (nth 3 state) (nth 4 state))
          (goto-char start)
          (let* ((kind (+ess-r--argument-kind (nth 1 state)))
                 (first-in-argument
                  (progn
                    (while (forward-comment -1))
                    (memq (char-before) '(?\( ?,)))))
            (goto-char end)
            (while (forward-comment 1))
            (cond
             ((and first-in-argument
                   (or (eq kind 'parameter)
                       (and (eq kind 'argument)
                            (eq (char-after) ?=)
                            (not (eq (char-after (1+ (point))) ?=)))))
              'dustveil-parameter-face)
             ((looking-at-p "::") 'font-lock-type-face)
             ((or (eq (char-after) ?\()
                  (looking-at-p "\\(?:<<-\\|<-\\|=\\)[ \t\n]*\\(?:function\\_>\\|\\\\\\)"))
              'font-lock-function-call-face)
             (t 'font-lock-variable-use-face))))))))

(defconst +ess-r--font-lock-keywords
  '(("\\_<[[:alpha:]_.][[:alnum:]_.]*\\_>\\|`\\(?:\\\\.\\|[^`\\\\]\\)*`"
     (0 (+ess-r--identifier-face) keep))
    ("[][{},;:!$@^~]" (0 (save-excursion
                           (save-match-data
                             (unless (nth 8 (syntax-ppss (match-beginning 0)))
                               'font-lock-punctuation-face)))
                         keep)))
  "Additional ESS captures for identifiers and punctuation.")

(defun +ess-r--font-lock-h ()
  "Add syntax-only identifier highlighting to ESS R buffers."
  (font-lock-remove-keywords nil +ess-r--font-lock-keywords)
  (font-lock-add-keywords nil +ess-r--font-lock-keywords 'append))

(after! ess-r-mode
  (dolist (feature '(ess-fl-keyword:fun-calls ess-fl-keyword:numbers
                     ess-fl-keyword:operators ess-fl-keyword:delimiters))
    (setf (alist-get feature ess-R-font-lock-keywords) t))
  (add-hook 'ess-r-mode-hook #'+ess-r--font-lock-h))

(after! lsp-clangd
  (dolist (argument '("--background-index" "--clang-tidy" "--completion-style=detailed"))
    (cl-pushnew argument lsp-clients-clangd-args :test #'equal)))

(setq lsp-pyright-langserver-command "basedpyright"
      lsp-pyright-disable-organize-imports t)

(after! (flycheck lsp-mode)
  (defun +lang-extras--chain-ruff-h ()
    (when (and lsp--buffer-workspaces
               (derived-mode-p 'python-mode 'python-ts-mode))
      (flycheck-add-next-checker 'lsp 'python-ruff)))
  (add-hook 'lsp-managed-mode-hook #'+lang-extras--chain-ruff-h))

(after! lsp-lua
  (setq lsp-lua-runtime-version "LuaJIT"
        lsp-lua-diagnostics-globals ["vim"]))

(after! apheleia
  (setf (alist-get 'python-mode apheleia-mode-alist) '(ruff-isort ruff)
        (alist-get 'python-ts-mode apheleia-mode-alist) '(ruff-isort ruff)))

(set-formatter! 'prettier :modes '(markdown-mode gfm-mode))

(set-formatter! 'shfmt
  '("shfmt" "-filename" filepath
    ;; Any printer flags disable shfmt's EditorConfig support.
    (unless (locate-dominating-file default-directory ".editorconfig")
      '("-i" "2" "-ci" "-bn"))
    "-")
  :modes '(sh-mode bash-ts-mode))
