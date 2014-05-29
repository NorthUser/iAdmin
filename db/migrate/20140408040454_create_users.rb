class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :limit => 20
      t.string :password, :limit => 64
      t.string :email, :limit => 35
      t.integer :person_id

      t.timestamps
    end
  end
end
