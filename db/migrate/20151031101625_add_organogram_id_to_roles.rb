class AddOrganogramIdToRoles < ActiveRecord::Migration
  def change
  	change_table :roles do |t|
      t.belongs_to :organogram, index: true
    end
  end
end
