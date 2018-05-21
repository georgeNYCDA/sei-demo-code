require './todo'

class TodoManager
	def initialize
		@current_id = 1
		@todos = []
	end

	def find(id)
		# find a todo by the id in the @todos array
	    # look into the detect method in ruby docs
	    # @todos.detect do |todo|
	    #   todo.id == id
	    # end
	    
	    @todos.each do |todo|
	      if id.to_i == todo.id.to_i
	        return todo
	      end
	    end
	end

	def add_todo(data)
	    # creates a new todo instance and adds it to @todos
	    # gives each todo an id
		# you can assume data is a hash with keys :name and :description

	    data[:id] = @current_id
	    my_todo = Todo.new(data)
	    @todos.push(my_todo)

	    @current_id += 1
	end

	def all_todos
		# returns all the todos 
	    @todos
	end
end