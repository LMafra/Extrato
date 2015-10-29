class CreatePerfomances < ActiveRecord::Migration
  def change
    create_table :perfomances do |t|
      t.string :name
      t.string :junior_companies_id
      t.string :federations_id
      t.string :role_id

      t.timestamps null: false
    end
  end
end
