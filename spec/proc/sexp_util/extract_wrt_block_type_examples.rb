# -*- encoding: utf-8 -*-

f(%%
## w do-block
##
#> [:method_add_block,
#>  [:method_add_arg, [:fcall, [:@ident, "proc", [15, 6]]], [:args_new]],
#>  [:do_block,
#>   nil,
#>   [:stmts_add,
#>    [:stmts_new],
#>    [:symbol_literal, [:symbol, [:@kw, "nil", [16, 5]]]]]]]
##
%,(
  b = proc do
    :nil
  end
))

f(%%
## w brace-block
##
#> [:method_add_block,
#>  [:method_add_arg, [:fcall, [:@ident, "proc", [32, 6]]], [:args_new]],
#>  [:brace_block,
#>   nil,
#>   [:stmts_add,
#>    [:stmts_new],
#>    [:symbol_literal, [:symbol, [:@kw, "nil", [33, 5]]]]]]]
##
%,(
  b = proc {
    :nil
  }
))

# __END__
