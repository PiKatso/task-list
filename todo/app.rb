require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/todo")

get("/") do
  @tasks = Task.all()
  erb(:index)
end

post("/tasks") do
  description = params.fetch("description")
  new_task = Task.new(description)
  new_task.save()
  erb(:output)
end
