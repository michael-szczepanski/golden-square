require "task_list"

RSpec.describe TaskList do
  it "initially has an empty list" do
    task_list = TaskList.new
    expect(task_list.all).to eq []
  end

  it "is initially not all complete" do
    task_list = TaskList.new
    expect(task_list.all_complete?).to eq false
  end

  # Unit test `#all` and `#all_complete?` behaviour

  context 'all method' do
    it 'returns a filled list' do
      task_list = TaskList.new
      task_1 = double :Task
      task_2 = double :Task
      task_list.add(task_1)
      task_list.add(task_2)
      expect( task_list.all ).to eq [task_1, task_2]
    end
    it 'returns empty list' do
      task_list = TaskList.new
      expect( task_list.all ).to eq []
    end
  end

  context 'all_complete? method' do
    it 'returns true if all tasks complete' do
      task_list = TaskList.new
      task_list.add(double :Task, complete?: true)
      task_list.add(double :Task, complete?: true)
      expect( task_list.all_complete? ).to eq true
    end
    it 'returns false if any task is incomplete' do
      task_list = TaskList.new
      task_list.add(double :Task, complete?: false)
      task_list.add(double :Task, complete?: true)
      expect( task_list.all_complete? ).to eq false
    end
    it 'returns false if all tasks incomplete' do
      task_list = TaskList.new
      task_list.add(double :Task, complete?: false)
      expect( task_list.all_complete? ).to eq false
    end
  end
end
