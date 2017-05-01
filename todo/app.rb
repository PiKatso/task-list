require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/todo")
require("./lib/list")
require("pg")

DB = PG.connect({:dbname => "to_do"})

get("/") do
  @lists = List.all()
  erb(:index)
end

post("/new_list") do
  name = params.fetch('list_name')
  new_list = List.new({:name => name, :id => nil})
  new_list.save
  redirect('/')
end

get("/list/:id") do
  @@list_id = params.fetch('id').to_i
  @tasks = []
  Task.all.each do |task|
    if task.list_id == @@list_id
      @tasks.push(task)
    end
  end
  erb(:list)
end

post("/new_task") do
  description = params.fetch("description")
  due_date = params.fetch("due_date")

  new_task = Task.new({:description => description, :list_id => @@list_id, :due_date => due_date})
  new_task.save()
  redirect('/list/' + @@list_id.to_s)
end

get('/list_delete') do
  @lists = List.all()
  erb(:list_delete)
end

get("/delete/:id") do
  @@list_id = params.fetch('id').to_i
  redirect(:single_list_delete)
end

get("/single_list_delete") do
  erb(:single_list_delete)
end

post("/ultra_delete") do
  DB.exec("DELETE FROM lists WHERE id = #{@@list_id};")
  redirect('/list_delete')
end
