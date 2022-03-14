# Design a Multi-Class Program

Learn to design a multi-class program.

> # Multi-Class Planned Design Recipe
>
> ## 1. Describe the Problem
>
> As a user
> So that I can record my experiences
> I want to keep a regular diary

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

> ## 2. Design the Class System

```ruby
def Diary
  def add(entry) # entry is an instance of DiaryEntry
  # returns nothing
  end

  def time_to_read(wpm, minute) #wpm is an integer, minute is an integer
  # returns the longest diary entry that can be read based on wpm and time
  end

  def read_all_entries
  # returns all formatted entries
  end

  def all_diary_numbers
  # returns a list of phone numbers of contacts that appear in the diary
  end
end

def DiaryEntry
  def intialize(title, contents) # title, contents are strings
  # ...
  end

  def read_entry
  # returns formatted diary entry
  end
end

def TodoList
  def intialize
  # ...
  end

  def add(task) # task is an instance of Task
  # returns nothing
  end

  def incomplete
  # returns a list of incomplete tasks
  end

  def complete
  # returns a list of complete tasks
  end

  def give_up!
  # returns nothing
  end
end

def Task(name)
  def initialize(name) #name is a string
  # ...
  end

  def mark_done
  # returns nothing
  end
end

def ContactList
  def initialize
  #...
  end

  def add(contact) # contact is an instance of contact
   # ...
  end


  def list_contacts
  # returns a list of contacts
  end
end

def Contact
  def initialize(name, number) # name, number are strings
  # ...
  end

  def name
  # returns name
  end

  def number
  # returns number
  end

  def display_contact
  # returns formatted contact details
  end
end
```

> ## 3. Create Examples as Integration Tests
>
> Create examples of the classes being used together in different situations
> and combinations that reflect the ways in which the system will be used.
>
> Encode one of these as a test and move to step 4.

> As a user
> So that I can record my experiences
> I want to keep a regular diary
> As a user
> So that I can reflect on my experiences
> I want to read my past diary entries

```ruby
diary = Diary.new
tuesday = DiaryEntry.new("Tuesday", "I went to McDonalds but it was shut")
wednesday = DiaryEntry.new("Wednesday", "I went back to McDonalds and it was open this time")
diary.add(tuesday)
diary.add(wednesday)
expect(diary.read_all_entries).to eq "" +
"My Diary\n" +
"Title: Tuesday. Entry: I went to McDonalds but it was shut.\n" +
"Title: Wednesday. Entry: I went back to McDonalds and it was open this time.\n"
```

> As a user
> So that I can reflect on my experiences in my busy day
> want to select diary entries to read based on how much time I have and my reading speed

```ruby
diary = Diary.new
tuesday = DiaryEntry.new("Tuesday", "I went to McDonalds but it was shut")
wednesday = DiaryEntry.new("Wednesday", "I went back to McDonalds and it was open this time")
thursday = DiaryEntry.new("Thursday", "I went to Five Guys")
diary.add(tuesday)
diary.add(wednesday)
diary.add(thursday)
expect(diary.time_to_read(1, 10)).to eq tuesday.read_entry
```

> As a user
> So that I can keep track of my tasks
> I want to keep a todo list along with my diary

```ruby
todo_list = TodoList.new
task1 = Task.new("Eat the burger")
task2 = Task.new("Clean my hands")
todo_list.add(task1)
todo_list.add(task2)
expect(todo_list.incomplete).to eq [task1, task2]
```

> As a user
> So that I can keep track of my contacts
> I want to see a list of all of the mobile phone numbers in all my diary entries

```ruby
diary = Diary.new
friday = DiaryEntry.new("Friday", "I met Dave, his phone number is 07845123123")
saturday = DiaryEntry.new("Saturday", "I went to the cinema and had a lovely time.")
sunday = DiaryEntry.new("Sunday", "Mary's phone number is 07854777666")
monday = DiaryEntry.new("Monday", "Quentin's phone number is 07854777555.") # Name not in contact list.
tuesday = DiaryEntry.new("Tuesday", "I met Dave again, his phone number is 07845123123") # Duplicate entry case.
wednesday = DiaryEntry.new("Wednesday", "I met Steve, his phone number is 0784512 ") # Invalid number
diary.add(friday)
diary.add(saturday)
diary.add(sunday)
expect(diary.all_diary_numbers).to eq ["Dave: 07845123123", "Mary: 07854777666", "Unkown: 07854777555"]
```

> ## 4. Create Examples as Unit Tests
``` ruby
contact_1 = Contact.new("Jon")
expect(contact_1.name_.to eq "Jon"

# More unit tests will be added, ad-hoc.
```
>
> Encode one of these as a test and move to step 5.
>
> ## 5. Implement the Behaviour
>
> For each example you create as a test, implement the behaviour that allows the
> class to behave according to your example.
>
> Then return to step 3 until you have addressed the problem you were given. You
> may also need to revise your design, for example if you realise you made a
> mistake earlier.