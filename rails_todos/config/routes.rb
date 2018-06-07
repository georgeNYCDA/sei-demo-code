Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :todos do
	resources :todo_comments, only: [:new, :create]

  	# collection do 
  	# 	get '/search', to: 'todos#search'
  	# 	get '/visible', to: 'todos#visible'
  	# 	get '/blahblah', to: 'todos#hidden'
  	# 	get '/blahblah2', to: 'todos#blahblah'
  	# 	post '/mark_all_read', to: 'todos#mark_all_read'
  	# end

  	# member do
  	# 	get '/mark_complete', to: 'todos#mark_complete'
  	# 	get '/hide', to: 'todos#hide'
  	# 	get '/share', to: 'todos#share'
  	# end


  end


  # resources :todo_comments
end
