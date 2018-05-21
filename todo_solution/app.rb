require 'sinatra'
require 'byebug'

require './todo'
require './todo_manager'

manager = TodoManager.new

get '/' do
	@todos = manager.all_todos
	erb :index
end

get '/todo/new' do
	erb :new
end

post '/todo/create' do
	manager.add_todo(params)

	redirect '/'
end

get '/todo/edit/:id' do
	@todo = manager.find(params[:id])

	erb :edit
end

post '/todo/update/:id' do
	todo = manager.find(params[:id])
	todo.update(params)

	redirect '/'
end



