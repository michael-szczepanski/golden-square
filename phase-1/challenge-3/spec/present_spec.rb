require './lib/present.rb'

RSpec.describe Present do
  it 'throws a "A contents has already been wrapped." error if wrapping a wrapped gift' do
    present = Present.new
    present.wrap("gift")
    expect { present.wrap("gift") }.to raise_error "A contents has already been wrapped."
  end

  it 'throws a "No contents have been wrapped" error if present not wrapped' do
    present = Present.new
    expect { present.unwrap }.to raise_error "No contents have been wrapped."
  end
end