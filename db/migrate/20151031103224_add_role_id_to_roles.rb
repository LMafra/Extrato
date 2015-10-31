class AddRoleIdToRoles < ActiveRecord::Migration
  def change
  	change_table :roles do |t|
      t.references :suprole, index: true
    end
  end
end
