class CreateTagRelations < ActiveRecord::Migration
  def change
    create_table :tag_relations do |t|
      t.integer :tag_id, null: false
      t.integer :comment_id
      t.integer :users_id
      t.integer :movie_id
      t.integer :agency_id
    end
  end
end
