class CreateIndicatorJuniorCompanies < ActiveRecord::Migration
  def change
    create_table :indicator_junior_companies do |t|
      t.string :name
      t.integer :value
      t.integer :indicator_id
      t.integer :junior_company_id

      t.timestamps null: false
    end
  end
end
