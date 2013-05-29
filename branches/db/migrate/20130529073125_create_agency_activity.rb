class CreateAgencyActivity < ActiveRecord::Migration
  def change
    create_table :agency_activity do |t|
      t.integer :agency_id, null: false
      t.integer :action, null: false
      t.integer :target_id, null: false
      t.string :target_type, null: false
    end
  end
end
