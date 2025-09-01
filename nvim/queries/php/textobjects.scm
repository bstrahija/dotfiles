;; Functions
((function_definition
  body: (_) @function.inner) @function.outer)

;; Methods
((method_declaration
  body: (_) @function.inner) @function.outer)

;; Classes
((class_declaration
  body: (_) @class.inner) @class.outer)
