class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :controller, :limit => 25
      t.string :action, :limit => 25
      t.string :key, :limit => 4
      t.string :description, :limit => 120

      t.timestamps
    end
  end
end
