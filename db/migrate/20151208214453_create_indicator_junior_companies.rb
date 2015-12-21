class CreateIndicatorJuniorCompanies < ActiveRecord::Migration
  def change
    create_table :indicator_junior_companies do |t|
      t.integer :value
      t.references :indicator
      t.references :junior_company

      t.timestamps null: false
    end
  end
end
