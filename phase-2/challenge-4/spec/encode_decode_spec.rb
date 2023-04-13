require 'encode_decode.rb'

RSpec.describe 'encode_decode' do
  context 'encodes and decodes correctly' do
    it 'encodes' do
      result = encode("theswiftfoxjumpedoverthelazydog", "secretkey")
      expect(
        result
      ).to eq "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
    end
    it 'decodes' do
      result = decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
      expect(result).to eq "theswiftfoxjumpedoverthelazydog"
    end

    it 'encode to decode should return same string' do
      string = "string"
      encoded = encode(string, "key")
      decoded = decode(encoded, "key")
      expect(
        string == decoded
      ).to eq true 
    end
  end
end