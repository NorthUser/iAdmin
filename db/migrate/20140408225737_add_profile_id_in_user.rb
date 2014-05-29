class AddProfileIdInUser < ActiveRecord::Migration
  def up
  	add_column :users, :profile_id, :integer
  end

  def down
  end
end
