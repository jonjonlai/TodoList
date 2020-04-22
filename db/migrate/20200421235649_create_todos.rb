class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.text :todo
      t.integer :user_id, null: false
      t.timestamps
    end

    add_index :todos, :user_id
  end
end
