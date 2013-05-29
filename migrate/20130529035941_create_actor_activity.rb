class CreateActorActivity < ActiveRecord::Migration
  def change
    create_table :actor_activity do |t|
      t.integer :actor_id, null: false
      t.integer :action, null: false
      t.string :content
      t.integer :target_id, null: false
      t.string :target_type, null: false
      t.timestamp :created_time, null: false
    end
  end
end
