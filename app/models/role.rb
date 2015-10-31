class Role < ActiveRecord::Base
  belongs_to:organograms
  belongs_to:areas
  has_many:perfomances
  has_many:users
end
