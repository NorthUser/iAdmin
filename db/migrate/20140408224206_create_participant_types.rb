class CreateParticipantTypes < ActiveRecord::Migration
  def change
    create_table :participant_types do |t|
      t.string :name, :limit => 30
      t.string :type, :limit => 3

      t.timestamps
    end
  end
end
