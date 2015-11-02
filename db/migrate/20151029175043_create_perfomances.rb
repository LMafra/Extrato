class CreatePerfomances < ActiveRecord::Migration
	drop_table :perfomances
  def change

    create_table :perfomances do |t|
      t.string :name
      t.string :junior_companies_id
      t.string :federations_id
      t.integer :role_id

      t.timestamps null: false
    end
  end
end
