class Todo
  def initialize(task) # task is a string
    @task = task
  end

  def task
    fail "Valid task required" if @task.empty?
    @task
  end

  def mark_done!
    fail "Already marked as done" if @task.include? "@done"
    @task += "@done"
    # Marks the todo as done
    # Returns nothing
  end

  def done?
    if @task.include? "@done"
      return true
    else
      return false
    end  
    # Returns true if the task is done
    # Otherwise, false
  end
end