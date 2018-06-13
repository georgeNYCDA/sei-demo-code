class TodosController < ApplicationController
	before_action :authenticate_user!

	def index
		@user = current_user
		@todos = Todo.all.order(:created_at)
	end

	def show
		@todo = Todo.find(params[:ids])
	end

	def new
		@todo = Todo.new
	end

	def create
		# the below will do the following
		# Todo.create({name: '...', description: '...'})
		@todo = Todo.create(todo_params)

		if @todo.valid?
			flash[:success] = 'Your todo has been successfully created'
			redirect_to todos_path
		else
			flash[:error] = 'Missing information'
			render :new
		end
	end

	def edit
		@todo = Todo.find(params[:id])
	end

	def update
		todo = Todo.find(params[:id])
		todo.update(todo_params)

		redirect_to todos_path
	end

	def destroy
		Todo.destroy(params[:id])

		redirect_to todos_path
	end

	private

	def todo_params
		# will return something that looks like this
		# {name: '...', :description: '...'}
		
		params.require(:todo).permit(:name, :description, :priority)
	end
end
