class CreateTodoComments < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_comments do |t|
      t.string :content
      t.references :todo, foreign_key: true

      t.timestamps
    end
  end
end
