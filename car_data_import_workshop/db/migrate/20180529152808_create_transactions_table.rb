class CreateTransactionsTable < ActiveRecord::Migration[5.2]
  def change

  	create_table :purchase_transactions do |t|
  		t.integer :customer_id
  		t.integer :car_id
  	end
  end
end
