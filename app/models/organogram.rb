class Organogram < ActiveRecord::Base
  belongs_to:federation
  belongs_to:junior_company
  has_many:areas
  has_many:roles
end
