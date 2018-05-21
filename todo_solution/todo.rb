class Todo
	attr_reader :name, :description, :id

	def initialize(data)
		@name = data[:name]
		@description = data[:description]
		@id = data[:id]
	end

	def update(data)
		@name = data[:name]
		@description = data[:description]
	end
	
end