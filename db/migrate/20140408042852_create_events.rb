class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.integer :event_type_id
      t.datetime :date
      t.integer :place_id
      t.text :summary

      t.timestamps
    end
  end
end
