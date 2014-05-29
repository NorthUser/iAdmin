class RenameColTypeInParticipantTypes < ActiveRecord::Migration
  def up
  	 rename_column :participant_types, :type, :type_access
  end

  def down
  	rename_column :participant_types, :type_access, :type
  end
end
