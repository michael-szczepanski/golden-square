require './lib/grammar_check.rb'

RSpec.describe 'grammar_check' do

  it 'returns true for capital at the beginning' do
    expect(
      grammar_check("String.")
    ).to eq true
  end

  it 'returns false for non-capital at the beginning' do
    expect(
      grammar_check("string!")
    ).to eq false
  end

  it 'returns true for puncuation at end' do
    expect(
      grammar_check("Phtring.")
    ).to eq true
  end

  it 'returns false for lack of punctuation at end' do
    expect(
      grammar_check("String")
    ).to eq false
  end

  context 'fails for non-string input' do
    it "fails for non-string" do
      expect { 
        grammar_check(["string"])
      }.to raise_error "text needs to be a string"
    end
  end

end