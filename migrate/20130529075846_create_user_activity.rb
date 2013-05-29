class CreateUserActivity < ActiveRecord::Migration
  def change
    create_table :user_activity do |t|
      t.integer :action, null: false
      t.integer :target_id
      t.string :target_type
      t.integer :user_id
      t.string :comment
      t.timestamp :create_date, null: false
    end
  end
end
