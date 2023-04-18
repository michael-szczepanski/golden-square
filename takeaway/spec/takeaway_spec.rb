require 'takeaway'

RSpec.describe Takeaway do
  it 'displays main screen for user' do
    io_dbl = double :kernel
    takeaway = Takeaway.new(io_dbl)
    expect(io_dbl)
      .to receive(:puts)
      .with("Please select option:\n1. List menu\n2. Select items\n3. See receipt\n4. Submit order")
    expect( takeaway.run )
  end
end