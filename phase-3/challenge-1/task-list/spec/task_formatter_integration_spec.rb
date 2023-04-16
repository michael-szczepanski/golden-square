require 'task_formatter'

RSpec.describe 'TaskFormatter integration' do
  it 'formats an incomplete task' do
    task = double :Task, title: 'title', complete?: false
    task_formatter = TaskFormatter.new(task)
    expect(
      task_formatter.format
    ).to eq '- [ ] title'
  end
  it 'formats a complete task' do
    task = double :Task, title: 'title', complete?: true
    task_formatter = TaskFormatter.new(task)
    expect(
      task_formatter.format
    ).to eq '- [X] title'
  end
end