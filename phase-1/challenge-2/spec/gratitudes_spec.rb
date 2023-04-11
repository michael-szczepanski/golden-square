require './lib/gratitudes.rb'

RSpec.describe Gratitudes do
  it 'returns "Be grateful for: my house, my health" after adding my house and my health' do
    grat = Gratitudes.new
    grat.add("my house")
    grat.add("my health")
    result = grat.format
    expect(result).to eq "Be grateful for: my house, my health"
  end

  it 'returns "Be grateful for: my house" after adding "my house"' do
    grat = Gratitudes.new
    grat.add("my house")
    result = grat.format
    expect(result).to eq "Be grateful for: my house"
  end
end