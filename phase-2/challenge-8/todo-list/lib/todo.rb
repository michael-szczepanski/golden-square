class Todo
  def initialize(task) # task is a string
    # ...
    fail 'task needs to be a string' unless task.is_a? String
    @task = task
    @done = false
  end

  def task
    # Returns the task as a string
    return @task
  end

  def mark_done!
    # Marks the todo as done
    # Returns nothing
    @done = true
  end

  def done?
    # Returns true if the task is done
    # Otherwise, false
    return @done
  end
end