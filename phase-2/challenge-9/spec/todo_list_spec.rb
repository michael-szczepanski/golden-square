require 'todo_list'

RSpec.describe TodoList do
  context 'initialization' do
    it 'constructs' do
      todo_list = TodoList.new
      todo_list.add('laundry')
      expect(
        todo_list.todos
      ).to eq ['laundry']
    end
    it 'raises "todo needs to be a string" error' do
     todo_list = TodoList.new
     expect{
      todo_list.add(['laundry'])
     }.to raise_error 'todo needs to be a string'
    end
  end

  context 'adds and returns todo list' do
    it 'returns correctly for 1 item in list' do
      todo_list = TodoList.new
      todo_list.add('laundry')
      expect(
        todo_list.todos
      ).to eq ['laundry']
    end
    it 'returns correctly for 2 items in list' do
      todo_list = TodoList.new
      todo_list.add('laundry')
      todo_list.add('shopping')
      expect(
        todo_list.todos
      ).to eq ['laundry', 'shopping']
    end
  end
end