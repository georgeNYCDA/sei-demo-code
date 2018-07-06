class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_line_one
      t.string :city
      t.string :state
      t.string :postal_code
      t.references :todo, foreign_key: true

      t.timestamps
    end
  end
end
