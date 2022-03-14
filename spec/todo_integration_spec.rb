require 'TodoList'

RSpec.describe TodoList do
  context "when making a new todolist" do
    it "it starts off with nothing on the list" do
      new_todo_list = TodoList.new
      result = new_todo_list.incomplete
      expect(result).to eq []
    end
  end
end