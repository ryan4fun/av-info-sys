class CreateAgency < ActiveRecord::Migration
  def change
    create_table :agency do |t|
      t.string :official_site
      t.text :introduce
      t.string :name, null: false
      t.text :text
      t.integer :mark_time
      t.float :total_mark
    end
  end
end
