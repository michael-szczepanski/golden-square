require 'report_length.rb'

describe 'report_length' do
  it 'returns "This string was 3 characters long. when given "str"' do
    length = report_length("str")
    expect(length).to eq "This string was 3 characters long."
  end
end