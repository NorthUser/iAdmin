class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, :limit => 30
      t.string :last_name, :limit => 30
      t.string :second_last_name, :limit => 30
      t.integer :person_type_id
      t.string :membership
      t.string :academic_degree
      t.text :biography

      t.timestamps
    end
  end
end
