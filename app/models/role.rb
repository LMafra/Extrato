class Role < ActiveRecord::Base
  belongs_to:organograms
  belongs_to:areas
  has_many:perfomances
  has_many:users
  has_many :suproles, class_name: "Role",
                          foreign_key: "suprole_id"
 
  belongs_to :suprole, class_name: "Role"
end
