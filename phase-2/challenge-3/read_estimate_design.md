## Describe
As a user
So that I can manage my time
I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute.

## Design
read_estimate(text)
wpm: 200 (2 will be used for testing purposes)
text_word_count: integer
returns integer

## Example
# examples will give answer in ms for maths purposes
read_estimate("one two") ==> 1
read_estimate("one two three four") => 2
read_estimate(1) ==> "text needs to be a string"