require 'todo_list'

RSpec.describe TodoList do
  it 'initializes' do
    todo_list = TodoList.new
    expect(
      todo_list
    ).to eq todo_list
  end
end