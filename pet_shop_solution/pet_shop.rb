require 'byebug'

require './queue'
require './animal'

pet_shop_queue = Queue.new

user_input = ''
current_ticket_number = 1

while user_input != '4' do
	
	puts "Please Select an Action: "
    puts "     1. Dog Arrived"
    puts "     2. Cat Arrived"
    puts "     3. Animal Completed"
    puts "     4. Quit"
    puts ""
    print "Selected Action: "

    user_input = gets.strip


    byebug

    case user_input
    when '1'
    	puts "Your dog is queued with ticket number: #{current_ticket_number}"
    	to_enqueue = Animal.new('Dog', current_ticket_number)
    	pet_shop_queue.enqueue(to_enqueue)
    	current_ticket_number = current_ticket_number + 1
    when '2'
    	puts "Your cat is queued with ticket number: #{current_ticket_number}"
    	to_enqueue = Animal.new('Cat', current_ticket_number)
    	pet_shop_queue.enqueue(to_enqueue)
    	current_ticket_number = current_ticket_number + 1
    when '3'
    	if pet_shop_queue.empty?
    		puts 'There are not pets waiting'
    	else
	    	animal = pet_shop_queue.dequeue
	    	puts "#{animal.type} with ticket number: #{animal.number} has now been served"
    	end
    when '4'
    	puts 'Thank you for using the pet shop. Have a great day'
    else
		puts "#{user_input} is not a valid option. Please try again"
    end


    # if user_input == '1'
    # 	puts "Your dog is queued with ticket number: #{current_ticket_number}"
    # 	to_enqueue = Animal.new('Dog', current_ticket_number)
    # 	pet_shop_queue.enqueue(to_enqueue)
    # 	current_ticket_number = current_ticket_number + 1
    # elsif user_input == '2'
    # 	puts "Your cat is queued with ticket number: #{current_ticket_number}"
    # 	to_enqueue = Animal.new('Cat', current_ticket_number)
    # 	pet_shop_queue.enqueue(to_enqueue)
    # 	current_ticket_number = current_ticket_number + 1
    # elsif user_input == '3'
    # 	animal = pet_shop_queue.dequeue
    # 	puts "#{animal.type} with ticket number: #{animal.number} has now been served"
    # elsif user_input == '4'
    # 	puts 'Thank you for using the pet shop. Have a great day'
    # else
    # 	puts "#{user_input} is not a valid option. Please try again"
    # end

end

