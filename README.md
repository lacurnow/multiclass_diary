# Design a Multi-Class Program

Learn to design a multi-class program.

> # Multi-Class Planned Design Recipe
> 
> ## 1. Describe the Problem
> 
> As a user
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
> 
> ## 2. Design the Class System
> 

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

  def all_diary_numbers
  # returns a list of phone numbers of contacts that appear in the diary
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
> 
> ## 4. Create Examples as Unit Tests
> 
> Create examples, where appropriate, of the behaviour of each relevant class at
> a more granular level of detail.
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

Copy and fill out [this template](../resources/multi_class_recipe_template.md)
for each of the below exercises.

## Demonstration

[A video demonstration](https://www.youtube.com/watch?v=CkyhW3pNTUY&t=0s)

## Exercise

This is the big one! You might want to start a new RSpec project for this.

Use object-oriented design and test-driven development, backed up by your
debugging and pairing skills, to develop the following program.

> As a user  
> So that I can record my experiences  
> I want to keep a regular diary

> As a user  
> So that I can reflect on my experiences  
> I want to read my past diary entries 

> As a user  
> So that I can reflect on my experiences in my busy day  
> I want to select diary entries to read based on how much time I have and my
> reading speed

> As a user  
> So that I can keep track of my tasks  
> I want to keep a todo list along with my diary

> As a user  
> So that I can keep track of my contacts  
> I want to see a list of all of the mobile phone numbers in all my diary
> entries

Some pointers:

* Remember that user stories don't map to classes 1:1. You'll need to digest the
  full problem and then develop a multi-class system that meets the user's
  needs.
* Don't worry about user interface or input-output. That means you shouldn't be
  using `gets` and only use `puts` for debugging purposes.
