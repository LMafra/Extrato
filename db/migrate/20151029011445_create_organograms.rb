class CreateOrganograms < ActiveRecord::Migration
  def change
    create_table :organograms do |t|
      t.integer :federation_id
      t.integer :junior_company_id
      t.date :date_initial
      t.date :date_final

      t.timestamps null: false
    end
  end
end
