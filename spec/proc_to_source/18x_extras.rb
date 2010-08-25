shared 'Proc#to_source from multi blocks w many matches spec (1.8.*)' do

  expected = 'proc { @x%s }'

  should 'skip non-matching (all do...end blocks)' do
    (
      b1 = lambda do |a| @x1 end; b2 = lambda do @x1 end; b3 = lambda do @x10 end; b2
    ).should.be having_code(expected%1)
  end

  should 'skip non-matching (all {...} blocks)' do
    (
      b1 = lambda {|a| @x2 }; b2 = lambda { @x2 }; b3 = lambda { @x20 }; b2
    ).should.be having_code(expected%2)
  end

  should 'skip non-matching (mixed {...} with do...end blocks)' do
    (
      b1 = lambda {|a| @x3 }; b2 = lambda do @x3 end; b3 = lambda { @x30 } ; b2
    ).should.be having_code(expected%3)
  end

  should 'skip non-matching (mixed do...end with {...} blocks)' do
    (
      b1 = lambda do |a| @x4 end; b2 = lambda { @x4 }; b3 = lambda do @x40 end; b2
    ).should.be having_code(expected%4)
  end

end
