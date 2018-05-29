require 'sinatra'
require './models'


# to generate a random string in the irb:
#  require 'securerandom'
#  SecureRandom.hex
set :session_secret, ENV['SEI_SESSION_SECRET']
enable :sessions

get('/') do
	erb :index
end

get('/signup') do
	erb :signup
end

post('/signup') do
	existing_user = User.find_by(email: params[:email])
	if existing_user != nil
		return redirect '/login'
	end

	user = User.create(
		first_name: params[:f_name],
  		last_name: params[:l_name],
  		email: params[:email],
  		password: params[:password],
	)
	session[:user_id] = user.id
	redirect '/dashboard'
end

get('/login') do 
	erb :login	
end

post('/login') do
	# params = {user_email: , password:}

	user = User.find_by(email: params[:user_email])
	if user.nil?
		return redirect '/login'
	end

	unless user.password == params[:password]
		return redirect '/login'
	end

	session[:user_id] = user.id
	redirect '/dashboard'
end


get('/dashboard') do
	user_id = session[:user_id]
	if user_id.nil?
		return redirect '/'
	end

	@user = User.find(user_id)

	erb :dashboard
end	
