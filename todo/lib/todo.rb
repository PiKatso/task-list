class Task
  attr_reader(:description, :due_date, :list_id)
  # @@all_tasks = []

  #initializes the instance of a task with description
  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @due_date = attributes.fetch(:due_date)
    @list_id = attributes.fetch(:list_id)
  end


  define_method(:==) do |another_task|
    self.description().==(another_task.description()).&(self.list_id().==(another_task.list_id())).&(self.due_date().==(another_task.due_date()))
  end

  #method to create a task list using classvariable
  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    returned_tasks.each do |task|
      description = task.fetch("description")
      list_id = task.fetch("list_id").to_i
      due_date = task.fetch("due_date")
      tasks.push(Task.new({:description => description, :list_id => list_id, :due_date => due_date}))
    end
    tasks
  end
  #method to push the tasks into the all_tasks
  define_method(:save) do
    DB.exec("INSERT INTO tasks (description, list_id, due_date) VALUES ('#{@description}', #{@list_id}, '#{@due_date}');")
  end

  #method to clear the list
  # define_singleton_method(:clear) do
  # end
end
