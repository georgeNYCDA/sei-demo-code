require 'sinatra'
require 'byebug'
require 'mailgun'

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

	mg_client = Mailgun::Client.new(ENV['MAILGUN_API_KEY'], 'api.mailgun.net','v3',false,false)	

	# Define your message parameters
	message_params =  { 
		from: 'my_email@nycda.com',
		to: 'my_email@nycda.com',
		subject: 'The Ruby SDK is awesome!',
		html: erb(:my_mail_template)
	}

	# Send your message through the client
	mg_client.send_message(ENV['MAILGUN_API_DOMAIN'], message_params)

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



