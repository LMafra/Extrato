class CreateJuniorCompanies < ActiveRecord::Migration
  def change
    create_table :junior_companies do |t|
      t.string :name
      t.integer :federation_id

      t.timestamps null: false
    end
  end
end
