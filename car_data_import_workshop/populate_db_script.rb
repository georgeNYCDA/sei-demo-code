require './models'
require 'csv'

# Everytime the script is run it clears the database, this 
# is okay while working on carson's request.
# Car.destroy_all
# Customer.destroy_all
# Transaction.destroy_all

# Create a few records...
# or import that CSV and create the appropriate records off of it. 


# to let you use the terminal to CRUD the database.


CSV.foreach("./CAR_DATA.csv") do |data_row|
	unless data_row[0] == 'id'
		my_customer = Customer.create(
			first_name: data_row[1],
			last_name: data_row[2],
			email: data_row[3],
			gender: data_row[4],
			phone_number: data_row[5]
		)

		my_car = Car.create(
			model: data_row[6],
			make: data_row[7],
			year: data_row[8],
			cost_price: data_row[9],
			sale_markup: data_row[10]
		)

		PurchaseTransaction.create(
			car: my_car,
			customer: my_customer
		)
	end

end