class CreateCategoryRelations < ActiveRecord::Migration
  def change
    create_table :category_relations do |t|
      t.integer :category_id, null: false
      t.integer :actor_id
      t.integer :movie_id
      t.integer :agency_id
    end
  end
end
