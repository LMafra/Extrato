class CreateDimensions < ActiveRecord::Migration
  def change
    create_table :dimensions do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
