shared 'Proc#to_source from { ... } block (w nested hash (w label-key))' do

  should 'handle watever(..) { ... } (label-key)' do
    x, @x, @@x, $x = 'lx', 'ix', 'cx', 'gx'
    (
      watever(:a, :b, {:c => 1}) {
        a = {a: 1, b: {c: 2}}
        [xx, x, @x, @@x, $x]
      }
    ).should.be having_same_code_as(expected2)
  end

  should 'handle watever { ... } (label-key)' do
    x, @x, @@x, $x = 'lx', 'ix', 'cx', 'gx'
    (
      watever {
        a = {a: 1, b: {c: 2}}
        [xx, x, @x, @@x, $x]
      }
    ).should.be having_same_code_as(expected2)
  end

  should 'handle lambda { ... } (label-key)' do
    x, @x, @@x, $x = 'lx', 'ix', 'cx', 'gx'
    (
      lambda {
        a = {a: 1, b: {c: 2}}
        [xx, x, @x, @@x, $x]
      }
    ).should.be having_same_code_as(expected2)
  end

end