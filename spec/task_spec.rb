require 'task'

RSpec.describe Todo do
  it "constructs" do
    new_todo = Todo.new("Walk the dog")
    expect(new_todo.task).to eq "Walk the dog"
  end

  context "when initialised with an empty string" do
    it "fails" do
      new_todo = Todo.new("")
      expect {new_todo.task}.to raise_error "Valid task required"
    end
  end

  context "mark_done!" do
    it "adds @done to mark task as done" do
      new_todo = Todo.new("Walk the dog")
      new_todo.mark_done!
      expect(new_todo.task).to eq "Walk the dog@done"
    end
  end
  
  context "done?" do
    it "returns true for complete tasks" do
      new_todo = Todo.new("Walk the dog")
      new_todo.mark_done!
      expect(new_todo.done?).to eq true
    end

    it "returns false for incomplete tasks" do
      new_todo = Todo.new("Walk the dog")
      expect(new_todo.done?).to eq false
    end
  end
end