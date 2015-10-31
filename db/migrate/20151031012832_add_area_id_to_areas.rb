class AddAreaIdToAreas < ActiveRecord::Migration
  def change
    change_table :areas do |t|
      t.references :subarea, index: true
    end
  end
end