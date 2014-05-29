class AddPdTypeInParticipantTypeAndDocumentType < ActiveRecord::Migration
  def up
  	add_column :participant_types, :pd_type_id, :integer
  	add_column :documents, :pd_type_id, :integer
  end

  def down
  end
end
