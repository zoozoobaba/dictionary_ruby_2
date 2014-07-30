require 'rspec'
require 'term'

describe 'Term' do
  it 'initializes a new Term object with word and definition variables' do
    new_term = Term.new('carrot', 'A delicious vegetable')
    new_term.term.key('A delicious vegetable').should eq 'carrot'
    new_term.term.fetch('carrot').should eq 'A delicious vegetable'
  end
end
