class Federation < ActiveRecord::Base
  has_many:junior_companies
  has_many:organograms
  has_many:perfomaces
end
