class CreateEventPermissions < ActiveRecord::Migration
  def change
    create_table :event_permissions do |t|
      t.integer :event_id
      t.integer :user_id
      t.integer :participant_type_id

      t.timestamps
    end
  end
end
