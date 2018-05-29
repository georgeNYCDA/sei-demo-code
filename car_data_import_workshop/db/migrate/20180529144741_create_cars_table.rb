class CreateCarsTable < ActiveRecord::Migration[5.2]
  def change
  	create_table :cars do |my_table|
  		my_table.string :model
  		my_table.string :make
  		my_table.integer :year
  		my_table.float :cost_price
  		my_table.float :sale_markup
  	end
  end
end
