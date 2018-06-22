namespace :dummy do
  task create_todos: :environment do
  	10.times do |i|
  		Todo.create(
  			name: i.to_s * 4,
  			description: "Dummy Description: #{i}",
  			priority: 'H'
		)
  	end
  end

  task create_comments: :environment do
  	
  end
end