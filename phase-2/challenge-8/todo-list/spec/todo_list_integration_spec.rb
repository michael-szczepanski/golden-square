require 'todo_list'
require 'todo'

RSpec.describe 'TodoList integration' do
  context 'add method' do
    it 'raises a "todo needs to be a Todo" error' do
      todo_list = TodoList.new
      todo = 'laundry'
      expect{
        todo_list.add(todo)
      }.to raise_error 'todo needs to be a Todo'
    end
  end

  context 'complete and incomplete methods' do
    it 'returns all incomplete' do
      todo_list = TodoList.new
      todo1 = Todo.new('laundry')
      todo2 = Todo.new('shopping')
      todo3 = Todo.new('cleaning')
      todo_list.add(todo1)
      todo_list.add(todo2)
      todo_list.add(todo3)
      todo2.mark_done!
      expect(
        todo_list.incomplete
      ).to eq [todo1, todo3]
    end

    it 'returns all complete' do
      todo_list = TodoList.new
      todo1 = Todo.new('laundry')
      todo2 = Todo.new('shopping')
      todo3 = Todo.new('cleaning')
      todo_list.add(todo1)
      todo_list.add(todo2)
      todo_list.add(todo3)
      todo2.mark_done!
      expect(
        todo_list.complete
      ).to eq [todo2]
    end
  end

  context 'give_up! marks all as complete' do
    it 'incomplete check' do
      todo_list = TodoList.new
      todo = Todo.new('laundry')
      todo_list.add(todo)
      todo_list.give_up!
      expect(
        todo_list.incomplete
      ).to eq []
    end
    it 'complete check' do
      todo_list = TodoList.new
      todo = Todo.new('laundry')
      todo_list.add(todo)
      todo_list.give_up!
      expect(
        todo_list.complete
      ).to eq [todo]
    end
  end
end