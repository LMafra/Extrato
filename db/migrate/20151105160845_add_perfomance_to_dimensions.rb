class AddPerfomanceToDimensions < ActiveRecord::Migration
  def change
    add_reference :dimensions, :perfomance, index: true, foreign_key: true
  end
end
