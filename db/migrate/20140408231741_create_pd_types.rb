class CreatePdTypes < ActiveRecord::Migration
  def change
    create_table :pd_types do |t|
      t.integer :participant_id
      t.integer :document_id

      t.timestamps
    end
  end
end
