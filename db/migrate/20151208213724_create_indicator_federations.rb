class CreateIndicatorFederations < ActiveRecord::Migration
  def change
    create_table :indicator_federations do |t|
      t.integer :value
      t.references :indicator
      t.references :federation

      t.timestamps null: false
    end
  end
end
