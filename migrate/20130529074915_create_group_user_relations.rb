class CreateGroupUserRelations < ActiveRecord::Migration
  def change
    create_table :group_user_relations do |t|
      t.integer :group_id, null: false
      t.integer :user_id, null: false
      t.timestamp :join_time, null: false
    end
  end
end
