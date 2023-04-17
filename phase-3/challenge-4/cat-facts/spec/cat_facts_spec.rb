require 'cat_facts'

RSpec.describe CatFacts do
  it 'returns a random cat fact' do
    requester_dbl = double :requester
    expect( requester_dbl )
      .to receive(:get)
      .and_return('{"fact":"A cat can jump up to five times its own height in a single bound.","length":65}')
    
    cat_facts = CatFacts.new(requester_dbl)
    expect( cat_facts.provide )
      .to eq "Cat fact: A cat can jump up to five times its own height in a single bound."
  end
end