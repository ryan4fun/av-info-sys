class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.text :description
      t.timestamp :create_date, null: false
    end
  end
end
