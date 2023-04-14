## Description
```
As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries
```
## Design
```
┌─────────────────────────────────┐  ┌────────┐
│Diary                            │  │TodoList│
│ @entry_list                     │  │ @list  │
│                                 │  │ -add   │
│                                 │  │ -todos │
│ -add_entry                      │  └────────┘
│ -list_entries                   │       ┌─────────────────┐
│ -list_specific_entries(wpm,time)│       │PhoneBook        │
│ -list_phone_numbers             │◄──────│ -extract_numbers│
└────────────┬────────────────────┘       └─────────────────┘
             │
             │contains a list of
             │
┌────────────▼────────────────────┐
│DiaryEntry                       │
│ @title                          │
│ @contents                       │
│ @word_count                     │
└─────────────────────────────────┘
```
## Integration tests
#### DiaryEntry
```
diary = Diary.new
entry = DiaryEntry.new('Lorem', 'Ipsum dolor')
entry2 = DiaryEntry.new('Sit', 'Amet consectetur adipiscing')
entry3 = DiaryEntry.new('Elit', 'Sed do eiusmod tempor')
diary.add_entry(entry)
diary.add_entry(entry2)
diary.add_entry(entry3)

diary.list_entries # => [entry]
diary.list_specific_entries('one', 2) # => wpm and minutes need to be integers
diary.list_specific_entries(1, 2) # => [entry]
diary.list_specific_entries(1, 3) # => [entry, entry2]
```
#### PhoneBook
```
diary = Diary.new
entry = DiaryEntry.new('Lorem', 'Ipsum 07789456123 dolor')
entry2 = DiaryEntry.new('Sit', '07123456789 Amet 07456789123 consectetur')
diary.add_entry(entry)
diary.list_phone_numbers # => [07789456123]
diary.add_entry(entry2)
diary.list_phone_numbers # => ['07789456123', '07123456789', '07456789123']
```
## Unit tests
#### TodoList
```
todo_list = TodoList.new
todo_list.add_entry('laundry')
todo_list.add_entry('shopping')
todo_list.lists # => ['laundry', 'lists']
```
#### DiaryEntry
```
entry = DiaryEntry.new(1, 'Ipsum Dolor') # => 'title needs to be a string'
entry = DiaryEntry.new('Lorem', 2) # => 'contents needs to be a string'
entry = DiaryEntry.new('Lorem', 'Ipsum dolor')
entry.title # => 'Lorem'
entry.contents # => 'Ipsum Dolor'
entry.word_count # => 2
```