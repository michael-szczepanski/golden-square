## Describe
As a user
So that I can keep track of my tasks
I want to check if a text includes the string #TODO.

## Design
includes_todo(string)
todo_string: string
returns true or false

## Examples
includes_todo("#TODO take trash out") ==> true
includes_todo("TODO laundry") ==> false
includes_todo("shopping") ==> false
includes_todo(1) ==> "Task should be a string."