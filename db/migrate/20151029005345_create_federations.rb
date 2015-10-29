class CreateFederations < ActiveRecord::Migration
  def change
    create_table :federations do |t|
      t.string :name
      t.string :abbreviation

      t.timestamps null: false
    end
  end
end
