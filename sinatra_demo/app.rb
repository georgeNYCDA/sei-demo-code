require 'sinatra'


get('/') do
	erb(:index)
end

get('/contact') do
	@contacts = [
		{title: 'President', name: 'Steve Jobs'},
		{title: 'CEO', name: 'Tim Cook'},
		{title: 'Designer', name: 'John Ives'},
	]

	erb(:contact_us)
end

get('/about') do
	erb(:about_us)
end

get('/order-form') do
	erb(:order_form)
end

post('/place-order') do
	p params
	f_name = params[:first_name]

	redirect "/order-success/#{f_name}"
end

# get('/hello/george') do
# 	"Hello George, Welcome"H
# end

get('/order-success/:person_name') do

	@name_to_display = params[:person_name]
	# favorite_dog = params[:favorite_dog]

	# "Hello #{name_to_display.capitalize}, Welcome, your favorite dog is #{favorite_dog}"
	erb(:person_greeting)
end