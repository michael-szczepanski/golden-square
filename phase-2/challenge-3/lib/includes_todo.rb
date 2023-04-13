def includes_todo(task)
  fail "Task should be a string." unless task.is_a? String

  todo_string = "#TODO"
  return task.include?(todo_string)
end