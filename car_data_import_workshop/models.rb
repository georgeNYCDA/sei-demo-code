require 'sinatra/activerecord'

# Based on http://www.jonathanleighton.com/articles/2011/awesome-active-record-bug-reports/ 



class Car < ActiveRecord::Base
	has_one :purchase_transaction
end

class Customer < ActiveRecord::Base
	has_one :purchase_transaction
end

class PurchaseTransaction < ActiveRecord::Base
	belongs_to :customer
	belongs_to :car


	def final_sale_price
		car.cost_price + (car.cost_price * car.sale_markup/100) + (car.cost_price * 0.088)
	end
end