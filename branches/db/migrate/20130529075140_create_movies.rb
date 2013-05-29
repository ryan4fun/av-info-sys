class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name, null: false
      t.text :wiki, null: false
      t.integer :mark_time
      t.float :total_mark
    end
  end
end
