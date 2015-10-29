class JuniorCompany < ActiveRecord::Base
  belongs_to:federation
  has_many:organograms
end
