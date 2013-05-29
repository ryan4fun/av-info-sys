class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string :content, null: false
      t.timestamp :create_date, null: false
      t.integer :target_id
      t.string :target_type
      t.integer :parent_id
    end
  end
end
