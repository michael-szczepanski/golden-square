require 'secret_diary'

RSpec.describe SecretDiary do
  context 'it constructs' do
    it 'initializes' do
      expect( SecretDiary.new(double :Diary) ).to be
    end
    it 'returns "Go away!"' do
      secret_diary = SecretDiary.new(double :Diary)
      expect( secret_diary.read ).to eq 'Go away!'
    end
  end
end