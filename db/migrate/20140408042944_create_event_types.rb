class CreateEventTypes < ActiveRecord::Migration
  def change
    create_table :event_types do |t|
      t.string :name, :limit => 80

      t.timestamps
    end
  end
end
