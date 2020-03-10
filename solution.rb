require 'sinatra'
require 'make_todo'

get '/' do
  @title = "Pagina Principal"
  erb :index, :layout => :layout
end

get '/createTask' do
  @title = "Crear Tarea"
  erb :create, :layout => :layout
end

get '/completeTask' do
  @title = "Completar Tarea"
  erb :complete, :layout => :layout
end

get '/deleteTask' do
  @title = "Borrar Tarea"
  erb :delete, :layout => :layout
end

get '/queryTask' do
  @title = "Consultar Tarea"
  erb :query, :layout => :layout
end

get '/listTasks' do
  @title = "Listar Tareas"
  @list = Tarea.all
  @completeTask = []
  @incompleteTask = []
  i = 0
  j = 0
  k = 0
  while i < @list.length
    if @list[i]["done"] == true
      @completeTask[j] = @list[i]
      j = j + 1
    else
      @incompleteTask[k] = @list[i]
      k = k + 1
    end
    i = i + 1
  end
  erb :list, :layout => :layout
end

post '/create' do 
  @title = "Pagina Principal"
  @create = Tarea.create(params[:title]).to_s
  erb :index, :layout => :layout
end

post '/complete' do
  @title = "Pagina Principal"
  @complete = Tarea.update(params[:id]).to_s
  erb :index, :layout => :layout
end

post '/delete' do
  @title = "Pagina Principal"
  @delete = Tarea.destroy(params[:id]).to_s
  erb :index, :layout => :layout
end



