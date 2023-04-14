class TodoList
  def initialize
    # Creates empty list
    @todos = []
  end

  def add(todo)
    # Adds todo to list
    # Returns nothing
    fail 'todo needs to be a string' unless todo.is_a? String
    @todos << todo
  end

  def todos
    # Returns todos
    return @todos
  end
end
