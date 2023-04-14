class TodoList
  def initialize
    @todos = []
  end

  def add(todo) # todo is an instance of Todo
    # Returns nothing
    fail 'todo needs to be a Todo' unless todo.is_a? Todo
    @todos. << todo
  end

  def incomplete
    # Returns all non-done todos
    incomplete = []
    @todos.each do |todo|
      incomplete << todo if todo.done? == false
    end
    return incomplete
  end

  def complete
    # Returns all complete todos
    complete = []
    @todos.each do |todo|
      complete << todo if todo.done? == true
    end
    return complete
  end

  def give_up!
    # Marks all todos as complete
    @todos.each do |todo|
      todo.mark_done!
    end
  end
end