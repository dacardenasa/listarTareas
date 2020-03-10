require 'sinatra'
require 'make_todo'

def consultar(dato)
  array = Array.new
  array.push(Tarea.find(dato))
    if array[0]["status"] == "404"
      true
    elsif array[0]["title"].length > 0
      false
    end
end

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

get '/listTasks' do
  @title = "Listar Tareas"
  @list = Tarea.all
  @completeTask = Array.new
  @incompleteTask = Array.new
  i = 0
  while i < @list.length
    if @list[i]["done"] == true
      @completeTask.push(@list[i])
    else
      @incompleteTask.push(@list[i])
    end
    i = i + 1
  end
  erb :list, :layout => :layout
end

post '/create' do 
  @title = "Pagina Principal"
  palabra = params[:title].gsub(/[[:space:]]/, '')
  if palabra.length == 0
    @create = true
  else
    Tarea.create(palabra).to_s
    @create = false
  end
  erb :index, :layout => :layout
end

post '/complete' do
  @title = "Pagina Principal"
  bandera = consultar(params[:id])
  if bandera == true
    @complete = "!El registro no existe en la Base de Datos¡"
  else
    @complete = Tarea.update(params[:id]).to_s
  end
  erb :index, :layout => :layout
end

post '/delete' do
  @title = "Pagina Principal"
  bandera = consultar(params[:id])
  if bandera == true
    @delete = "!El registro no existe en la Base de Datos¡"
  else
    @delete = Tarea.destroy(params[:id]).to_s
  end
  erb :index, :layout => :layout
end



