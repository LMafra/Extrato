class CreateIndicatorFederations < ActiveRecord::Migration
  def change
    create_table :indicator_federations do |t|
      t.string :name
      t.integer :value
      t.integer :indicator_id
      t.integer :federation_id

      t.timestamps null: false
    end
  end
end
