[[
   #grammar cf

   #define start      ::= $scope statements;
   #define statements ::= statement statements;
   #define statements ::= $eof;
   #define statement  ::= <= [ => "var" new_var assigning eol <= ] , =>;
   #define statement  ::= <= [ > => var assigning eol <= ] , =>;
   #define statement  ::= <= [ => expr eol <= ] ; =>;
   #define expr       ::= obj ops;
   #define obj        ::= $reference;
   #define obj        ::= $literal;
   #define obj        ::= $numeric;
   #define obj        ::= <= < => $var;
   #define obj        ::= <= *system'dynamic'Struct { => "{" fields <= } =>;
   #define obj        ::= <= *system'dynamic'Tape { => "function" func <= } =>;
   #define ops        ::= "." call ops;
   #define ops        ::= $eps; 
   #define call       ::= <= ^ => msg args;
   #define msg        ::= $identifier;
   #define args       ::= <= ( => "(" expr next_arg <= ) =>;
   #define args       ::= <= ( => $eps <= ) =>;
   #define next_arg   ::= "," expr next_arg;
   #define next_arg   ::= ")";
   #define eol        ::= ";";
   #define new_var    ::= $newvar;
   #define var        ::= $var;
   #define assigning  ::= "=" expr;
   #define fields     ::= field field_exp next_field;
   #define field      ::= <= % => $identifier;
   #define field_exp  ::= <= [ => ":" expr <= ] =>;
   #define next_field ::= "," fields;
   #define next_field ::= "}";
   #define func       ::= $scope func_r;
   #define func_r     ::= $new func_body;
   #define func_body  ::= $new xparams tape ;
   #define xparams    ::= "(" new_var next_xprm;
   #define next_xprm  ::= "," new_var next_xprm;
   #define next_xprm  ::= ")";
   #define tape       ::= "{" xstatement xstatements;
   #define xstatements::= "}" ;
   #define xstatement ::= <= [ => xexpr <= ] =>;
   #define xexpr      ::= xobj xops;
   #define xobj       ::= $reference;   
   #define xobj       ::= $literal;
   #define xobj       ::= $numeric;
   #define xobj       ::= <= system'dynamic'tapeControl &getAt&args ( => $var <= ) =>;   
   #define xobj       ::= <= *system'dynamic'Struct { => "{" fields <= } =>;
   #define xobj       ::= <= *system'dynamic'Tape { => "function" func <= } =>;   
   #define xops       ::= "." xcall xops;
   #define xops       ::= $eps; 
   #define xcall      ::= <= & => msg xargs;
   #define xargs      ::= <= ( => "(" xexpr next_xarg <= ) =>;
   #define xargs      ::= <= ( => $eps <= ) =>;
   #define next_xarg  ::= "," xexpr next_xarg;
   #define next_xarg  ::= ")";
   
   #config vm_console 
   #start;
]]
