#### Story

A method called make_snippet that takes a string as an argument and returns the first five words and then a '...' if there are more than that.

#### Design
make_snippet(String)
return: String

#### Examples
make_snippet("one two three") ==> "one two three"
make_snippet("") ==> ""
make_snippet(1) ==> "Not a string"
make_snippet("o t t f f s") ==> "o t t f f..."