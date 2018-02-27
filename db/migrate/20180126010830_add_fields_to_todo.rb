class AddFieldsToTodo < ActiveRecord::Migration[5.1]
  def change
  	add_column :todos, :title, :string
  	add_column :todos, :completed, :boolean
  end
end
