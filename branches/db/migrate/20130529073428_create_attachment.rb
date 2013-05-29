class CreateAttachment < ActiveRecord::Migration
  def change
    create_table :attachment do |t|
      t.string :name
      t.string :description
      t.integer :target_id, null: false
      t.string :target_type, null: false
      t.string :path
      t.string :type, null: false
    end
  end
end
