class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name, :limit => 20
      t.string :permissions

      t.timestamps
    end
  end
end
