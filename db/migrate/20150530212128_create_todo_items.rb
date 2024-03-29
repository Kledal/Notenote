class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.string :name
      t.boolean :done, default: false
      t.references :list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
