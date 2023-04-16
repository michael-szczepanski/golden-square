require 'secret_diary'

RSpec.describe 'SecretDiary integration' do
  context 'it locks and reads contents' do
    it 'unlocks and reads' do
      diary = double :Diary, read: 'contents'
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      expect( secret_diary.read ).to eq 'contents'
    end
    it 'locks' do
      diary = double :Diary, read: 'contents'
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      secret_diary.lock
      expect( secret_diary.read ).to eq 'Go away!'
    end
  end
end