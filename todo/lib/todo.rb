class Task

  @@all_tasks = []
  #initializes the instance of a task with description
  define_method(:initialize) do |description|
    @description = description
  end
  #create a description method
  define_method(:description) do
    @description
  end
  #method to create a task list using classvariable
  define_singleton_method(:all) do
    @@all_tasks
  end
  #method to push the tasks into the all_tasks
  define_method(:save) do
    @@all_tasks.push(self.description)
  end
  #method to clear the list
  define_singleton_method(:clear) do
    @@all_tasks = []
  end
end
