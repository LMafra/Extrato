class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.integer :organogram_id
      t.string :name

      t.timestamps null: false
    end
  end
end
