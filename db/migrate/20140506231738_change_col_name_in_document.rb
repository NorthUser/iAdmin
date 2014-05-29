class ChangeColNameInDocument < ActiveRecord::Migration
  def up
  	rename_column :documents, :attribute, :type_attribute
  end

  def down
  	rename_column :documents, :type_attribute, :attribute
  end
end
