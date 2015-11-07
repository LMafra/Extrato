class AddPerfomanceToDimensions < ActiveRecord::Migration
  def change
    add_reference :dimensions, :performance, index: true, foreign_key: true
  end
end
