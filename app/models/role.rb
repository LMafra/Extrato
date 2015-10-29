class Role < ActiveRecord::Base
  belongs_to:areas
  has_many:perfomances
end
