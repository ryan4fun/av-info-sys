class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.integer :agency_id
      t.string :cn_name, null: false
      t.string :en_name, null: false
      t.string :jp_name
      t.string :nation
      t.string :weight
      t.text :introduce
      t.string :birth_place
      t.string :cup
      t.string :BWH
      t.string :height
      t.timestamp :birthday
      t.text :wiki
      t.float :total_mark
      t.integer :mark_time
    end
  end
end
