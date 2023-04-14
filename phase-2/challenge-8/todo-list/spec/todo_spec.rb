require 'todo'

RSpec.describe 'Todo' do
  context 'raises "task needs to be a string" error' do
    it 'fails' do
      expect {
        todo = Todo.new(['laundry'])
      }.to raise_error 'task needs to be a string'
    end
  end

  it 'returns task' do
    todo = Todo.new('laundry')
    expect(
      todo.task
    ).to eq 'laundry'
  end

  context 'done? and mark_done! methods' do
    it 'returns false for incomplete' do
      todo = Todo.new('laundry')
      expect(
        todo.done?
      ).to eq false
    end

    it 'returns true for complete' do
      todo = Todo.new('laundry')
      todo.mark_done!
      expect(
        todo.done?
      ).to eq true
    end
  end
end