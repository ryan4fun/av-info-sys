class CreateParameter < ActiveRecord::Migration
  def change
    create_table :parameter do |t|
      t.string :key, null: false
      t.string :value, null: false
    end
  end
end
