class TodosController < ApplicationController
	before_action :authenticate_user!
	before_action :set_todo, only: [:show, :edit]
	before_action :set_priorities, only: [:new, :edit]

	skip_before_action :verify_authenticity_token, only: [:destroy]

	def index
		@user = current_user
		@todos = Todo.created_after(Date.today - 5.days).high_priority.order(:created_at)
	end

	def show
		return redirect_to todos_path if @todo.nil?
	end

	def new
		@todo = Todo.new
		# @todo.address = Address.new
		@todo.build_address # ^-- same as above
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
		
	end

	def update
		todo = Todo.find(params[:id])
		todo.update(todo_params)

		redirect_to todos_path
	end

	def destroy
		Todo.destroy(params[:id])

		render json: {status: 'boom success', message: 'todo was successfully deleted'}
	end

	private

	def set_todo
		begin
			@todo = Todo.find(params[:id])
		rescue StandardError => e
			flash[:error] = 'Invalid Id Provided'
			@todo = nil
		end
	end

	def set_priorities
		@priorities = TodoPriority.all
	end

	def todo_params
		# will return something that looks like this
		# {name: '...', :description: '...'}
		
		params.require(:todo).permit(
			:name, 
			:description, 
			:priority, 
			:address_attributes => [:address_line_one, :city, :state, :postal_code]
		)
	end
end
