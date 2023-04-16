require 'diary'

RSpec.describe Diary do
  context 'it constructs and returns contents' do
    it 'raises "contents needs to be a string" error' do
      expect{ Diary.new(1) }.to raise_error 'contents needs to be a string'
    end
    it 'reads contents' do
      diary = Diary.new('contents')
      expect( diary.read ).to eq 'contents'
    end 
  end
end