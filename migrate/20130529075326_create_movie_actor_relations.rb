class CreateMovieActorRelations < ActiveRecord::Migration
  def change
    create_table :movie_actor_relations do |t|
      t.integer :movie_id
      t.integer :actor_id
    end
  end
end
