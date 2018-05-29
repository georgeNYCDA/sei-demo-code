class CreateCustomersTable < ActiveRecord::Migration[5.2]
  def change
  	create_table :customers do |t|
  		t.string :first_name
  		t.string :last_name
  		t.string :email
  		t.string :gender
  		t.string :phone_number
  	end
  end
end
