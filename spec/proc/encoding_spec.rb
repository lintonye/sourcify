# -*- coding: utf-8 -*-
#
# NOTE: The examples in this file are adapted from the original pull
# request submitted by tomykaira @ https://github.com/ngty/sourcify/pull/19,
# which fixes the issue @ https://github.com/ngty/sourcify/issues/15
#
require File.join(File.expand_path(File.dirname(__FILE__)), 'spec_helper')

describe "Encoding" do

  should "handle proc with UTF-8 string" do
    lambda { "こんにちは" }.should.be having_sexp(
      s(:iter, s(:call, nil, :proc, s(:arglist)), nil, s(:str, "こんにちは"))
    )
  end

  should "handle proc with unicode regexp" do
    lambda { /\p{Lu}/ }.should.be having_sexp(
      s(:iter, s(:call, nil, :proc, s(:arglist)), nil, s(:lit, /\p{Lu}/))
    )
  end

  should "handle proc with UTF-8 heredoc" do
    (
      lambda do
        <<-EOL
          こんにちは
        EOL
      end
    ).should.be having_sexp(
      s(:iter, s(:call, nil, :proc, s(:arglist)), nil, s(:str, "          こんにちは"))
    )
  end

end
