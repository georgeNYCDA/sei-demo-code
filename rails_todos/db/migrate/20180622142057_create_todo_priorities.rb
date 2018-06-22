class CreateTodoPriorities < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_priorities do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
