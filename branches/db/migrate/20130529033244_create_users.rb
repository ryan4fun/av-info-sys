class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password, null: false
      t.string :nickname
      t.string :email, null: false
      t.timestamp :register_date, null: false
    end
  end
end
