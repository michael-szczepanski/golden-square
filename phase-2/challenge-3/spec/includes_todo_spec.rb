require 'includes_todo'

RSpec.describe 'includes_todo' do
  it 'returns true if it find #TODO within task' do
    expect(
      includes_todo("#TODO take trash out")
    ).to eq true
  end

  it 'returns false for partial matches of #TODO within task' do
    expect(
      includes_todo("TODO laundry")
    ).to eq false
  end

  it 'returns false for strings not including #TODO' do
    expect(
      includes_todo("shopping")
    ).to eq false
  end

  context 'raises error "Task should be a string." for non-string task' do
    it 'fails' do
      expect{
        includes_todo(1)
      }.to raise_error "Task should be a string."
    end
  end
end