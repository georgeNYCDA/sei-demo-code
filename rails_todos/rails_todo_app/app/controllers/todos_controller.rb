class TodosController < ApplicationController

	def index
		@todos = Todo.all.order(:created_at)
	end

	def show
		@todo = Todo.find(params[:id])
	end

	def new
		@todo = Todo.new
	end

	def create
		# the below will do the following
		# Todo.create({name: '...', description: '...'})
		Todo.create(todo_params)

		redirect_to todos_path
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
		
		params.require(:todo).permit(:name, :description)
	end
end
