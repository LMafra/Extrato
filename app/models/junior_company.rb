class JuniorCompany < ActiveRecord::Base
  belongs_to :federation
  has_many :organograms
  has_many :perfomances
  has_many :indicator_junior_companies
  has_many :indicator, through: :indicator_junior_companies
end
