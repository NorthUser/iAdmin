class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title, :limit => 80
      t.string :url
      t.string :attribute, :limit => 4
      t.integer :event_id

      t.timestamps
    end
  end
end
