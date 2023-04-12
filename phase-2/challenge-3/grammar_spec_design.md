## Describe
As a user
So that I can improve my grammar
I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

## Design
grammar_check(string)
capital ==> boolean
punctuation ==> boolean
return boolean

## Example
grammar_check("String.") ==> true
grammar_check("string!") ==> false
grammar_check("Phtring.") ==> true 
grammar_check("String") ==> false
grammar_check(["string"]) ==> "text needs to be a string