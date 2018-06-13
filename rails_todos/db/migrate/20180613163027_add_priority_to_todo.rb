class AddPriorityToTodo < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :priority, :string
  end
end
