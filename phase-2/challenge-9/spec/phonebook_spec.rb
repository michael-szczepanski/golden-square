require 'phonebook'

RSpec.describe PhoneBook do
  context 'raises corect errors' do
    it 'fails if entry_list is not an array' do
      phonebook = PhoneBook.new
      expect{
        phonebook.extract_numbers('string')
      }.to raise_error 'entry_list must be an array'
    end
  end
end