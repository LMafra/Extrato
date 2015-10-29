class Area < ActiveRecord::Base
  belongs_to:organogram
  has_many:role
end
