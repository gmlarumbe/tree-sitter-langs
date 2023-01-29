;; Strings
(string_literal) @string
(double_quoted_string) @string

;; Comments
(comment) @comment

;; Function/tasks identifiers
(function_identifier
 (function_identifier
  (simple_identifier) @function))

(task_identifier
 (task_identifier
  (simple_identifier) @function))

;; Class declaration
(class_declaration
 (class_identifier) @function
 (class_type
  (class_identifier
   (simple_identifier) @type)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Method qualifiers (virtual/local/protected/pure)
(class_method
 (method_qualifier) @function.builtin)

;; Class function prototypes return types
(class_item
 (class_method
  (function_prototype
   (data_type_or_void) @type)))

;; Class function declaration return types
(function_declaration
 (function_body_declaration
  (function_data_type_or_implicit1
   (data_type_or_void) @type)))






;; Macros
;; [
;;  (include_compiler_directive)
;;  (default_nettype_compiler_directive)
;;  (timescale_compiler_directive)
;;  ] @function.macro

;; (text_macro_identifier
;;  (simple_identifier) @function.macro)



;;
;;
;;
;; TODO
;;
;;




;; User typedefs
(net_declaration
 (simple_identifier) @type)

;; Modules/Instances
(module_instantiation
 (simple_identifier) @verilog-module
 (hierarchical_instance
  (name_of_instance
   (instance_identifier
    (simple_identifier) @verilog-instance))))

;; Error
;; TODO: Not sure if it's a good idea to highlight this
;; , since not all code is supported:
;;  - e.g.: macros inside ports show as an ERROR
;;  - external function declarations also show as ERROR
;; (ERROR) @error

;; Class types (attributes) - Put before class extensions?
(class_item
 (class_property
  (data_declaration
   (data_type_or_implicit1
    (data_type
     (class_type
      (class_identifier
       (simple_identifier) @type)))))))

;;
(class_item
 (class_property
  (data_declaration
   (data_type_or_implicit1
    (data_type
     (simple_identifier) @type)))))







; Keywords

;; [; block delimeters
;;   (module_keyword)
;;   "endmodule"
;;   "program"
;;   "endprogram"
;;   "class"
;;   "endclass"
;;   "interface"
;;   "endinterface"
;;   "package"
;;   "endpackage"
;;   "checker"
;;   "endchecker"
;;   "config"
;;   "endconfig"

;;   "final"
;;   "alias"
;;   "iff"
;;   "illegal_bins"
;;   "intersect"
;;   "module"
;;   "class"
;;   "unique"
;;   "property"
;;   ;; "after"
;;   "macromodule"
;;   ;; "connectmodule"
;;   "interconnect"
;;   "showcancelled"
;;   "soft"
;;   "forkjoin"
;;   "or"
;;   "assume"

;;   "pure"
;;   "virtual"
;;   "extends"
;;   "implements"
;;   "super"
;;   (class_item_qualifier)

;;   "parameter"
;;   "localparam"
;;   "defparam"
;;   "assign"
;;   "typedef"
;;   "modport"
;;   "fork"
;;   "join"
;;   "join_none"
;;   "join_any"
;;   "default"
;;   "break"
;;   "assert"
;;   (unique_priority)
;;   "tagged"
;;   "extern"
;; ] @keyword

;; [
;;   "function"
;;   "endfunction"

;;   "task"
;;   "endtask"
;; ] @keyword.function

;; "return" @keyword.return

;; [
;;   "begin"
;;   "end"
;; ] @label

;; [
;;   (always_keyword)
;;   "generate"
;;   "for"
;;   "foreach"
;;   "repeat"
;;   "forever"
;;   "initial"
;;   "while"
;; ] @repeat

;; [
;;   "if"
;;   "else"
;;   (case_keyword)
;;   "endcase"
;; ] @conditional


;; (include_compiler_directive) @constant.macro
;; (package_import_declaration
;;  "import" @include)

;; (package_import_declaration
;;  (package_import_item
;;   (package_identifier
;;    (simple_identifier) @constant)))

;; (package_scope
;;  (package_identifier
;;   (simple_identifier) @constant))

;; (package_declaration
;;  (package_identifier
;;   (simple_identifier) @constant))

;; (parameter_port_list
;;  "#" @constructor)

;; [
;;   "="
;;   "-"
;;   "+"
;;   "/"
;;   "*"
;;   "^"
;;   "&"
;;   "|"
;;   "&&"
;;   "||"
;;   ":"
;;   (unary_operator)
;;   "{"
;;   "}"
;;   "'{"
;;   "<="
;;   "@"
;;   "or"
;;   "and"
;;   "=="
;;   "!="
;;   "==="
;;   "!=="
;;   "-:"
;;   "<"
;;   ">"
;;   ">="
;;   "%"
;;   ">>"
;;   "<<"
;;   "|="
;;   (inc_or_dec_operator)
;; ] @operator

;; (cast
;;  ["'" "(" ")"] @operator)

;; (edge_identifier) @attribute

;; (port_direction) @label
;; (port_identifier
;;  (simple_identifier) @variable)

;; [
;;   (net_type)
;;   (integer_vector_type)
;;   (integer_atom_type)
;; ] @type.builtin

;; [
;;   "signed"
;;   "unsigned"
;; ] @label

;; (data_type
;;  (simple_identifier) @type)

;; (method_call_body
;;   (method_identifier) @field)

;; (interface_identifier
;;  (simple_identifier) @type)

;; (modport_identifier
;;  (modport_identifier
;;   (simple_identifier) @field))

;; (net_port_type1
;;  (simple_identifier) @type)

;; [
;;   (double_quoted_string)
;;   (string_literal)
;; ] @string


;; ; begin/end label
;; (seq_block
;;  (simple_identifier) @comment)

;; [
;;  ";"
;;  "::"
;;  ","
;;  "."
;; ] @punctuation.delimiter


;; (default_nettype_compiler_directive
;;  (default_nettype_value) @string)

;; (text_macro_identifier
;;  (simple_identifier) @constant)

;; (module_declaration
;;  (module_header
;;   (simple_identifier) @constructor))


;; (parameter_identifier
;;  (simple_identifier) @parameter)

;; [
;;   (integral_number)
;;   (unsigned_number)
;;   (unbased_unsized_literal)
;; ] @number

;; (time_unit) @attribute

;; (checker_instantiation
;;  (checker_identifier
;;   (simple_identifier) @constructor))

;; (module_instantiation
;;  (simple_identifier) @constructor)

;; (name_of_instance
;;  (instance_identifier
;;   (simple_identifier) @variable))

;; (interface_port_declaration
;;  (interface_identifier
;;   (simple_identifier) @type))

;; (net_declaration
;;  (simple_identifier) @type)

;; (lifetime) @label


;; (function_subroutine_call
;;  (subroutine_call
;;   (tf_call
;;    (simple_identifier) @function)))

;; (function_subroutine_call
;;  (subroutine_call
;;   (system_tf_call
;;    (system_tf_identifier) @function.builtin)))


;; ;;TODO: fixme
;; ;(assignment_pattern_expression
;;  ;(assignment_pattern
;;   ;(parameter_identifier) @field))

;; (type_declaration
;;   (data_type ["packed"] @label))

;; (struct_union) @type

;; [
;;   "enum"
;; ] @type

;; (enum_name_declaration
;;  (enum_identifier
;;   (simple_identifier) @constant))


;; [
;;   (integer_atom_type)
;;   (non_integer_type)
;;   "genvar"
;; ] @type.builtin

;; (struct_union_member
;;  (list_of_variable_decl_assignments
;;   (variable_decl_assignment
;;    (simple_identifier) @field)))

;; (member_identifier
;;  (simple_identifier) @field)

;; (struct_union_member
;;  (data_type_or_void
;;   (data_type
;;    (simple_identifier) @type)))

;; (type_declaration
;;  (simple_identifier) @type)

;; (generate_block_identifier) @comment

;; [
;;   "["
;;   "]"
;;   "("
;;   ")"
;; ] @punctuation.bracket

;; (ERROR) @error


;; TODO: Tests here
;; (simple_identifier
;;  (.match? @constant "after")) @constant



;; TODO: Still does not support external function declarations
;; (function_body_declaration
;;  (function_identifier
;;   (simple_identifier) @function.builtin)
;;  (ERROR
;;   (class_identifier
;;    (simple_identifier) @function)))
