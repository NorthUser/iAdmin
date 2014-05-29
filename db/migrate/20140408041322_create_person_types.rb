class CreatePersonTypes < ActiveRecord::Migration
  def change
    create_table :person_types do |t|
      t.string :role, :limit => 30
      t.string :category
      t.boolean :public

      t.timestamps
    end
  end
end
