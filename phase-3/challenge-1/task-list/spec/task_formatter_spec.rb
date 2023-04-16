require 'task_formatter'

RSpec.describe TaskFormatter do
  it 'it constructs' do
    expect( TaskFormatter.new(double :Task) ).to be
  end
end