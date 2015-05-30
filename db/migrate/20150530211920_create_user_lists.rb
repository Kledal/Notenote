class CreateUserLists < ActiveRecord::Migration
  def change
    create_table :user_lists do |t|
      t.boolean :owner, default: :false
      t.references :user, index: true, foreign_key: true
      t.references :list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
