class CreateDimensions < ActiveRecord::Migration
  def change
    create_table :dimensions do |t|
      t.string :name
      t.string :description
      t.references :perfomance, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
